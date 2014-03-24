class CreateDsProducts < ActiveRecord::Migration
  def change
    create_table :ds_products do |t|
			t.integer		:external_id
			t.integer		:product_id
			t.string 		:full_name
			t.float 		:max_price
			t.float 		:min_price
			t.float 		:avg_price
			t.integer		:drugstore_count

      t.timestamps
    end

    add_index :ds_products, :external_id
    add_index :ds_products, :product_id
  end
end
