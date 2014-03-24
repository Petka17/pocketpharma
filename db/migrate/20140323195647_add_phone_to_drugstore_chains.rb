class AddPhoneToDrugstoreChains < ActiveRecord::Migration
  def change
    add_column :drugstore_chains, :phone, :string
  end
end
