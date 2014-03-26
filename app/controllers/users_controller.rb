class UsersController < ApplicationController

	before_filter :signed_in_check, 	except: [:new, :create]
	before_filter :admin_check, 			only: 	[:delete_drugstore]
	before_filter :get_user, 					except: [:index, :new, :create]
	before_filter :get_ds_chain, 			only: 	[:show, :edit_ds_chain, :new_drugstore]

	# User list
	def index
		redirect_to current_user unless current_user.admin?
		@users = User.user_list
	end

	# User Profile
	def show
		@drugstores = @ds_chain.drugstores
		@drugstore = Drugstore.new
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

	# Edit user profile
	def edit
	end

	# Update user profile
	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Данные успешно обновлены"
			redirect_to @user			
		else
			render 'edit'
		end
	end

	def edit_ds_chain	
	end

	# Create or edit new dugstore chain
	def update_ds_chain
		if @user.drugstore_chain
			@user.drugstore_chain.update_attributes(chain_params)
		else
			@user.create_drugstore_chain(chain_params)
			@user.save
		end

		flash[:success] = "Данные успешно обновлены"
		redirect_to @user
	end

	# New Drugstore
	def new_drugstore
		if @user.drugstore_chain.nil?
			flash[:danger] = "Укажите данные об аптечной сети"
		else
			@ds_chain.drugstores.create(drugstore_params)
		end
	
		redirect_to @user
	end

	# Delete Exising Drugstore
	def delete_drugstore
		Drugstore.find(params[:drugstore][:id]).destroy
  	redirect_to @user
	end

	private

		def get_user
			@user = current_user.admin? ? User.find(params[:id]) : current_user
		end

		def get_ds_chain
			@ds_chain = @user.drugstore_chain || DrugstoreChain.new
		end

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def chain_params
			params.require(:drugstore_chain).permit(:name, :phone, :description)
		end

		def drugstore_params
			params.require(:drugstore).permit(:name, :address, :working_hours, :phone)
		end
		
end
