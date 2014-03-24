class CreateProductPrices < ActiveRecord::Migration
  def change
    create_table :product_prices do |t|
			t.integer 	:ds_product_id
			t.integer 	:drugstore_id
			t.integer 	:external_id
			t.text	 		:full_name
			t.float 		:price
			t.integer 	:amount
      t.timestamps
    end

    add_index :product_prices, :ds_product_id
    add_index :product_prices, :drugstore_id
    add_index :product_prices, :external_id
  end
end
