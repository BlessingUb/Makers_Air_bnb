require './lib/dbconnect' # this should be path to the dbconnect class

if ENV['RACK_ENV'] == 'test' 
  DBConnect.setup('makersbnb_test')
else
  DBConnect.setup('makersbnb')
end