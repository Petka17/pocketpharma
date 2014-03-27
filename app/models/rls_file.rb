class RlsFile < ActiveRecord::Base

	mount_uploader :rls_file, RlsFileUploader

	belongs_to :user

	before_create :set_default_name
	before_create :set_default_size
	
	def RlsFile.files_list
		includes(:user)
	end

	def user_name
		user.name if user		
	end

	private

		def set_default_name
		  self.name ||= File.basename(rls_file.filename, '.*') if rls_file
		end

		def set_default_size
		  self.size = rls_file.size() if rls_file
		end

end
