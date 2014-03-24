class DrugstoresController < ApplicationController

	before_filter :admin_check, 		only: 	[:index]
	before_filter :signed_in_check, except: [:index]
	before_filter :get_drugstore, 	only: 	[:show, :update, :insert_ds_file, :delete_ds_file]

  def index
  	@drugstores = Drugstore.all
  end

  def show
		@ds_files = @drugstore.ds_files
		@ds_file 	= DsFile.new
  end

  def update
  	@drugstore.update_attributes(drugstore_params)
  	redirect_to @drugstore
  end

  def insert_ds_file
  	@ds_file = @drugstore.ds_files.create(ds_file_params)
  end

  def delete_ds_file
  	DsFile.find(params[:ds_file][:id]).destroy
  	redirect_to @drugstore
  end

  private

  	def get_drugstore
  		@drugstore = Drugstore.find(params[:id])
  		@user = @drugstore.user
  		redirect_to current_user unless current_user.admin? || current_user == @user
  	end

  	def drugstore_params
  		params.require(:drugstore).permit(:name, :address, :working_hours, :phone)
  	end

  	def ds_file_params
  		params.require(:ds_file).permit(:file)
  	end

end
