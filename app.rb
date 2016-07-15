require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/hair_stylist")
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get '/' do
  @clients = Client.all
  @stylists = Hair_stylist.all
  erb(:index)
end

get '/stylists/new' do
  erb(:hair_stylist_form)
end

post '/stylists' do

end
