class UsersController < ApplicationController
	before_action :authenticate_user!,except: [:index]
	before_action :same_user! ,only:[:watch_list]

	def index
		@user = current_user
		@user_all =  User.all

	end

	def new
	end

	def edit
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy

		redirect_to root_path
	end

	def update
		
		current_user.update(admin_params)
		if current_user.admin_password == 'admin1'
			current_user.update_attribute :admin, true
			redirect_to root_path
		else
			redirect_to admin_user_path(current_user)
		end
	end

	

	def watch_list
		@movies = User.find(params[:id]).movies
	end
	def add_movies
		@movies = Movie.all
	end
	def add_to_watchlist
		@user = User.find(params[:id])
		@user.movies << Movie.find(params[:movie_id])
		redirect_to watch_list_user_path(@user)
	end





	protected

	def admin_params
		params.require(:user).permit(:admin_password)
	end

	def valid_password?(password)
		current_user.admin_password == password
		
	end

	def same_user!
		@user = User.find(params[:id])
		redirect_to root_path,alert:'you have to login first' unless @user.id == current_user.id
	end

end
