class CreateDsFiles < ActiveRecord::Migration
  def change
    create_table :ds_files do |t|
    	t.string 		:file
    	t.integer 	:drugstore_id
      t.timestamps
    end
  end
end
