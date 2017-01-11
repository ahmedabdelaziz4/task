class ReviewsController < ApplicationController
	before_action :set_movie
	before_action :authenticate_user!
	

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.user = current_user
		if @movie.reviews << @review
			redirect_to movie_path(@movie)
		else
			render :new
		end
	end

	protected

	def set_movie
		@movie = Movie.find params[:movie_id]
	end

	def review_params
		params.require(:review).permit(:name,:rating)
		
	end


end