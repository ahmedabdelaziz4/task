class DirectorsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!,except: [:index,:show]
	def index
		@directors = Director.all

	end

	def new
		@director = Director.new

	end

	def edit
		@director = Director.find(params[:id])
	end

	def show
		@director = Director.find(params[:id])

	end

	def destroy
		@director=Director.find(params[:id])
		@director.destroy

		redirect_to directors_path
	end

	def update
		@director = Director.find(params[:id])
		@director.update(directors_params)

		

		redirect_to directors_path
	end


	def create
		@director = Director.new(directors_params)
		@director.name.capitalize!
		@director.save

		redirect_to directors_path


	end

	def add_movies
		@movies = Movie.all
		@director = Director.find(params[:id])
	end

	def add_to_director
		@director = Director.find(params[:id])
		@director.movies << Movie.find(params[:movie_id])
		redirect_to director_path(@director)
	end


	

	protected

	def directors_params
		params.require(:director).permit(:name,:year)
	end
end
