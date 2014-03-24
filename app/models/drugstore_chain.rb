class DrugstoreChain < ActiveRecord::Base
	has_many :drugstores
	has_one :user
end
