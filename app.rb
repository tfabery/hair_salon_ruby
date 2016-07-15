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
  erb(:stylist_form)
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

delete '/stylists' do
  Hair_stylist.find_by_id(params['id'].to_i).delete
  @clients = Client.all
  @stylists = Hair_stylist.all
  erb(:index)
end

delete '/clients' do
  Client.find_by_id(params['id'].to_i).delete
  @clients = Client.all
  @stylists = Hair_stylist.all
  erb(:index)
end

get '/stylist/:id/edit' do
  @stylist = Hair_stylist.find_by_id(params['id'])
  erb(:stylist)
end

get '/client/:id/edit' do
  @client = Client.find_by_id(params['id'])
  @stylist = Hair_stylist.find_by_id(@client.stylist)
  @stylists = Hair_stylist.all
  erb(:client)
end

patch '/stylists' do
  name = params['name']
  Hair_stylist.find_by_id(params['id']).update({name: name})
  @clients = Client.all
  @stylists = Hair_stylist.all
  erb(:index)
end

patch '/clients' do
  name = params['name']
  Client.find_by_id(params['id']).update({name: name})
  @clients = Client.all
  @stylists = Hair_stylist.all
  erb(:index)
end

post '/client/:id' do
  @client = Client.find_by_id(params['id'])
  @client.update({hair_stylist_id: params['stylist']})
  @stylist = Hair_stylist.find_by_id(@client.stylist)
  @stylists = Hair_stylist.all
  erb(:client)
end
