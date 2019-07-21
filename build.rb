require 'sportdb/import'

DB_CONFIG = {
  adapter:  'postgresql',
  encoding: 'unicode',
  username: 'postgres',
  password:  'changeme',
  host: 'localhost',
  database: 'premiership',
  pool:      5,
  timeout:   5000
}

ActiveRecord::Base.establish_connection( DB_CONFIG )

Dir.chdir "eng-england"

 ## build schema 
 SportDb.create_all 

 ## turn on logging to console 
 ActiveRecord::Base.logger = Logger.new(STDOUT) 

 pack = CsvMatchImporter.new( '../england' ) 
 pack.import_leagues 