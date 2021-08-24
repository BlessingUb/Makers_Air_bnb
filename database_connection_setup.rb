require './lib/db_connection'

if ENV['RACK_ENV'] == 'test' 
  DBConnect.setup('makersbnb_test')
else
  DBConnect.setup('makersbnb')
end