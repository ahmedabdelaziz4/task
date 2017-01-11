class GenreController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!,except: [:index,:show]
	def index
		@genres = Genre.all
	end

	def new
		@genre = Genre.new
	end

	def create
		@genre = Genre.new(genre_params)
		@genre.save

		redirect_to genre_index_path
	end

	def update
		@genre = Genre.find(params[:id])
		@genre.update(genre_params)

		redirect_to genre_index_path
	end

	def show
		@genre = Genre.find(params[:id])
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def destroy
		@genre = Genre.find(params[:id])
		@genre.destroy

		redirect_to genre_index_path
	end

	def category
		@genre = Genre.find(params[:id])
		@movies = @genre.movies

	end

	def add_movies
		@movies = Movie.all
		@genre = Genre.find(params[:id])
	end
	def add_to_genre
		@genre = Genre.find(params[:id])
		@genre.movies << Movie.find(params[:movie_id])
		redirect_to category_genre_path(@genre)
	end

protected

	def genre_params
		params.require(:genre).permit(:name)
	end
end
