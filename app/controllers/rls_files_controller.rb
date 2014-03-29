class RlsFilesController < ApplicationController

	before_filter :admin_check
	before_filter :get_rls_file, only: [:destroy, :treat]

	def index
		@rls_files = RlsFile.files_list
		@rls_file = RlsFile.new(user_id: current_user.id)
	end

	def create
		@rls_file = RlsFile.create(rls_file_params)
	end

	def destroy
		@rls_file.destroy
		redirect_to rls_files_path
	end

	def treat
		@job = Delayed::Job.enqueue(RlsFileWorker.new(@rls_file.rls_file.url()))
	end


	
	private

		def get_rls_file
			@rls_file = RlsFile.find(params[:id])
		end

		def rls_file_params
			params.require(:rls_file).permit(:user_id, :rls_file)
		end
		
end
