class RlsFile < ActiveRecord::Base

	require 'roo'

	validates :name, 		presence: true
	validates :user_id, presence: true

	belongs_to :user
	
	mount_uploader :rls_file, RlsFileUploader

	def RlsFile.files_list
		joins(:user).select("rls_files.*, users.name as user_name")
	end

	def treat
		debugger
		spreadsheet = Roo::Excel.new(rls_file.file.file.to_s)
	  header = spreadsheet.row(1)
		inserts = []

	  (2..spreadsheet.last_row).each do |i|	    
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    ean = row["ean"].to_s.empty? ? "NULL" : row["ean"].to_i
	    inserts.push "(#{row["code"]},\'#{row["name"]}\',\'#{row["category"]}\',\'#{row["type"]}\',\'#{row["form"]}\',\'#{row["dose"]}\',\'#{row["pack"]}\',\'#{row["company"]}\',\'#{row["country"]}\',\'#{row["inn"]}\',#{ean})"
	  end

		sql = "INSERT INTO rls_products (code, name, category, product_group_type, product_form, dose, pack, company, country, inn, ean) VALUES #{inserts.join(", ")}"

    ActiveRecord::Base.connection.execute sql
	end


end
