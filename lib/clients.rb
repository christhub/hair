class Client

  attr_reader(:name, :id, :stylist_id)

  define_method(:initialize) do |attributes|
    @name             = attributes.fetch(:name)
    @id               = attributes.fetch(:id)
    @stylist_id       = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    database_retrival = DB.exec("SELECT * FROM clients;")
    clients           = []
    database_retrival.each() do |client|
      name            = client.fetch('name')
      id              = client.fetch('id').to_i
      stylist_id      = client.fetch('stylist_id').to_i
      clients << Client.new({name: name, id: id, stylist_id: stylist_id})
    end
    clients
  end

  define_method(:save) do
    result            = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{name}', #{stylist_id}) RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  define_method(:==) do |other_client|
    (self.name && self.id) == (other_client.name && other_client.id)
  end

  define_singleton_method(:find) do |identifier|
    found_client = nil
    Client.all().each() do |client|
      if client.id == identifier
        found_client = client
      end
    end
    found_client
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE clients SET name = '#{@name}', stylist_id = #{stylist_id} WHERE id = #{@id};")
  end

end
