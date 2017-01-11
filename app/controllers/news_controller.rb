class NewsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!,except: [:index,:show]
	def index
		@news = News.search(params[:search])
	end

	def new
		@news = News.new
	end

	def create
	@news = News.new(news_params)
	@news.save

	redirect_to news_index_path
	end

	def update
		@news = News.find(params[:id])
		@news.update(news_params)

		redirect_to news_index_path
	end

	def show
		@news = News.find(params[:id])
	end

	def edit
		@news = News.find(params[:id])
	end

	def destroy
		@news = News.find(params[:id])
		@news.destroy

		redirect_to news_index_path

	end
protected

	def news_params
		params.require(:news).permit(:publisher,:content)
	end

end
