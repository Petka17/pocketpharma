class AddDrugstoreChainIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :drugstore_chain_id, :integer
  end
end
