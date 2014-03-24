class CreateDrugstoreChains < ActiveRecord::Migration
  def change
    create_table :drugstore_chains do |t|
    	t.string		:name
    	t.string		:description
      t.timestamps
    end
  end
end
