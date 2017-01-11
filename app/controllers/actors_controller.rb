class ActorsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!,except: [:index,:show]
	

  	
	def index
		
		@actors = Actor.search(params[:search])

	end

	def new
		@actor = Actor.new

	end

	def edit
		@actor = Actor.find(params[:id])
	end

	def show
		@actor = Actor.find(params[:id])

	end

	def destroy
		@actor=Actor.find(params[:id])
		@actor.destroy

		redirect_to actors_path
	end

	def update
		@actor = Actor.find(params[:id])
		@actor.update(actors_params)

	redirect_to actors_path
	end
	def create
	@actor = Actor.new(actors_params)
	@actor.name.capitalize!
	@actor.save

	redirect_to actors_path


	end

	protected

	def actors_params
		params.require(:actor).permit(:name,:year)
	end

	


end
