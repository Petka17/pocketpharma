class Drugstore < ActiveRecord::Base
	belongs_to :drugstore_chain
	belongs_to :user, foreign_key: "drugstore_chain_id", 
										primary_key: "drugstore_chain_id"
	has_many :ds_files
	has_many :price_products
end
