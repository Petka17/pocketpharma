class AddSizeToRlsFiles < ActiveRecord::Migration
  def change
    add_column :rls_files, :size, :integer
  end
end
