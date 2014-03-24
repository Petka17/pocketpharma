class CreateDrugstores < ActiveRecord::Migration
  def change
    create_table :drugstores do |t|
    	t.integer		:drugstore_chain_id
			t.integer		:external_id
			t.string		:name
			t.string		:address
			t.string		:working_hours
			t.string		:phone
			t.datetime	:data_last_update
			t.integer		:product_num
      t.timestamps
    end
  end
end
