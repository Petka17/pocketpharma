class DsFile < ActiveRecord::Base

	belongs_to :drugstore

	mount_uploader :file, DrugstoreFileUploader

end
