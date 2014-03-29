class	RlsFileWorker < Struct.new(:file_url)
	
	require 'roo'

	def perform

		job = Delayed::Job.find(@job_id)

		puts "Reading File"

		spreadsheet = Roo::Excel.new(file_url)
	  header = spreadsheet.row(1)
		inserts = []

		progress = spreadsheet.last_row.to_f

	  (2..progress).each do |i|
	    
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    ean = row["ean"].to_s.empty? ? "NULL" : row["ean"].to_i
	    inserts.push "(#{row["code"]},\'#{row["name"]}\',\'#{row["category"]}\',\'#{row["type"]}\',\'#{row["form"]}\',\'#{row["dose"]}\',\'#{row["pack"]}\',\'#{row["company"]}\',\'#{row["country"]}\',\'#{row["inn"]}\',#{ean})"

	    if i % 1000 == 0
		    job.update_attribute :progress, (i / progress * 100).round
	 	    puts (i / progress * 100).round
 	  	end

	  end
	  
	  job.update_attribute :progress, 100

		sql = "INSERT INTO rls_products (code, name, category, product_group_type, product_form, dose, pack, company, country, inn, ean) VALUES #{inserts.join(", ")}"

		puts "Update DB"

    ActiveRecord::Base.connection.execute sql

		puts "Finish"
	end

	def before(job)
    @job_id = job.id
  end 

end