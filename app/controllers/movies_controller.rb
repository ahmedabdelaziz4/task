class MoviesController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!,except: [:index,:show,:opening_movies]
	def index
		@movie = Movie.search(params[:search])

	end

	def new
		@movie = Movie.new
	end

	def edit
		@movie=Movie.find(params[:id])
	end

	def show
		@movie = Movie.find(params[:id])
		@genres = @movie.genres
		@reviews = @movie.reviews
	end

	def destroy
		@movie=Movie.find(params[:id])
		@movie.destroy

		redirect_to movies_path
	end

	def create
		
	@movie = Movie.new(movie_params)
	@movie.name.capitalize!
	if @movie.save
		redirect_to movies_path
	else 
		render :new
	end
	
	
	
	
	end

	def update
		@movie=Movie.find(params[:id])
		@movie.update(movie_params)
			

		redirect_to @movie
		
	end

	def act
		@actors = Movie.find(params[:id]).actors
		@movie =Movie.find(params[:id])
		
	end
	def director
		@director = Movie.find(params[:id]).director
		redirect_to @director
	end

	def add_act
		@movie = Movie.find(params[:id])
		@actors = Actor.all
	end

	def add_to_movie
		@movie = Movie.find(params[:id])
		@movie.actors << Actor.find(params[:actor_id])
		redirect_to act_movie_path(@movie)
	end

	def opening_movies
		@movie  = Movie.all
		@start_date = (Date.today)
		@end_date = (Date.today + 7.days)

	end




	



	protected

	def movie_params
		params.require(:movie).permit(:name,:image,:awards,:rating,:release_date)
	end
end
