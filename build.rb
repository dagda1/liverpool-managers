require 'sportdb/import'

## note: requires a local copy of the football.db clubs datasets
##          see https://github.com/openfootball/clubs
SportDb::Import.config.clubs_dir = './clubs'

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

## build database schema / tables
SportDb.create_all

## turn on logging to console
ActiveRecord::Base.logger = Logger.new(STDOUT)


## note: requires a local copy of the football.csv england datasets
##          see https://github.com/footballcsv/england
pack = CsvMatchImporter.new( './england' )
pack.import_leagues

