require('rspec')
require('pg')
require('pry')
require('client')
require('hair_stylist')

DB = PG.connect({:dbname => "hair_salon_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
    DB.exec("DELETE FROM hair_stylists *;")
  end
end
