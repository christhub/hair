class Stylists

  attr_reader(:name, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @client_id = attributes.fetch(:stylist_id)
    @id   = attributes.fetch(:id)
  end

end
