class UsersController < ApplicationController

	# User Profile
	def show
		@user = User.find(params[:id])
	end

	# Singup from
	def new	
		@user = User.new
	end

	# Create new user
	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Добро пожаловать в сервис PocketPharma"
			redirect_to @user
		else
			render 'new'
		end
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
