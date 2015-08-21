require('sinatra/reloader')
require('sinatra')
also_reload('lib/**/*.rb')
require('./lib/clients')
require('./lib/stylists')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

get('/admin/') do
  @stylists = Stylist.all
  @clients = Client.all
  erb(:admin)
end

post('/admin/new-client/') do
  name = params.fetch('name')
  stylist_id = params.fetch('stylist_id').to_i
  @client = Client.new(name: name, id: nil, stylist_id: stylist_id)
  @client.save
  redirect('/admin/')
end

post('/admin/new-stylist/') do
  name = params.fetch('name')
  @stylist = Stylist.new(name: name, id: nil)
  @stylist.save
  redirect('/admin/')
end

delete("/admin/delete-stylist/:id/") do
  @stylist = Stylist.find(params.fetch('id').to_i)
  @stylist.delete
  @stylist = Stylist.all
  redirect('/admin/')
end

delete("/admin/delete-client/:id/") do
  @client = Client.find(params.fetch('id').to_i)
  @client.delete
  @client = Client.all
  redirect('/admin/')
end
