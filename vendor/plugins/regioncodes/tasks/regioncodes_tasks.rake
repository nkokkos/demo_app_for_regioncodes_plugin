require 'fastercsv'

namespace :db do
  namespace :migrate do
    
 desc "This will migrate your regionscode table into your database"
  task :regioncodes => :environment do  
      ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true 
      ActiveRecord::Migrator.migrate("vendor/plugins/regioncodes/lib/db/migrate/", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)  
      Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby  
    end
  end
end

namespace :regioncodes do 
  
  desc "This task will insert regioncodes data into the table named regioncodes"
  task :insertdata => :environment do  
      puts "Reading number of lines to parse..."
      lines = File.readlines("#{RAILS_ROOT}/vendor/plugins/regioncodes/data/dioik_diairesi_09_el.csv")
      puts "Lines to parse and import: " + (lines.length).to_s
      puts "Started importing data..."
      puts "Percent completed:"
      @counter = 0
      @number_of_lines = (lines.length).to_f

    FasterCSV.foreach("#{RAILS_ROOT}/vendor/plugins/regioncodes/data/dioik_diairesi_09_el.csv", :headers => true, :col_sep => ';') do |row|
      Regioncode.create(:code_index => row[0], :code => row[1], :description => row[2])
      print "\r#{"%5.1f" % ((@counter/@number_of_lines)*100) }"
      @counter = @counter + 1.0
    end
      puts "\n"
      puts "Finished importing regioncodes data"
  end
end
