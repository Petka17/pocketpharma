class AddStatusToRlsFiles < ActiveRecord::Migration
  def change
  	add_column :rls_files, :status, :string, default: "Uploaded"
  end
end
