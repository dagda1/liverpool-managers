require 'sportdb/models'
require 'datafile'

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

SportDb.create_all
SportDb.read_builtin

datafile = Datafile::Datafile.load_file( "./Datafile" )

datafile.dump

datafile.download    ## download zips from github - saved to ./tmp
datafile.read        ## read into / import into sql database
