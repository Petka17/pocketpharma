class CreateRlsFiles < ActiveRecord::Migration
  def change
    create_table :rls_files do |t|
    	t.string :name
    	t.string :rls_file
    	t.integer :user_id
    	
      t.timestamps
    end
  end
end
