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
  name = params.fetch('new_client_name')
  stylist_id = params.fetch('stylist_id').to_i
  @client = Client.new(name: name, id: nil, stylist_id: stylist_id)
  @client.save
  redirect('/admin/')
end

post('/admin/new-stylist/') do
  name = params.fetch('new_stylist_name')
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

patch('/admin/update-client/:id/') do
  @client = Client.find(params.fetch("id").to_i)
  name = params.fetch("updated_client_name")
  if name == ""
    name = @client.name
  end
  updated_stylist_id = params.fetch("updated_stylist_id").to_i
  @client.update({name: name, stylist_id: updated_stylist_id})
  redirect('/admin/')
end

patch('/admin/update-stylist/:id/') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  name = params.fetch("updated_stylist_name")
  if name == ' '
    name = @stylist.name
  end
  @stylist.update({name: name})
  redirect('/admin/')
end
