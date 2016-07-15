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

get '/clients/new' do
  erb(:client_form)
end

post '/stylists' do
  name = params['name']
  Hair_stylist.new({name: name}).save
  @clients = Client.all
  @stylists = Hair_stylist.all
  erb(:index)
end

post '/clients' do
  name = params['name']
  Client.new({name: name}).save
  @clients = Client.all
  @stylists = Hair_stylist.all
  erb(:index)
end
