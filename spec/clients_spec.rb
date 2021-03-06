require('spec_helper')

  test_client = Client.new({:name => "Ivan", :stylist_id => 1, :id => nil})

describe(Client) do
  describe("#name") do
    it('will return the name of the stylist') do
      expect(test_client.name).to(eq("Ivan"))
    end
  end

  describe("#id") do
    it('will return the id of the stylist') do
      expect(test_client.id).to(eq(nil))
    end
  end

  describe("#stylist_id") do
    it('will return the id of the stylist') do
      expect(test_client.stylist_id).to(eq(1))
    end
  end

  describe('.all') do
    it('will initialize an empty array') do
      test_client = Client.all
      expect(test_client).to(eq([]))
    end
  end

  describe('#==') do
    it("will compare two objects and see if they're the same") do
      client1 = test_client
      client2 = test_client
      expect(client1).to(eq(client2))
    end
  end

  describe('#save') do
    it('will save the client to the database') do
      testy_client = Client.new({:name => "Theodore", :stylist_id => 1, :id => nil})
      testy_client.save()
      expect(Client.all()).to(eq([testy_client]))
    end
  end

  describe('.find') do
    it('will find a client based on an identifier') do
      testy_client = Client.new({:name => "Theodore", :stylist_id => 1, :id => 1})
      testy_client.save
      expect(Client.find(testy_client.id())).to(eq(testy_client))
    end
  end

  describe('#delete') do
    it('will delete the entry from the database') do
      testy_client = Client.new({:name => "Theodore", :stylist_id => 1, :id => nil})
      testy_client.save
      testier_client = Client.new({:name => "Brad", :stylist_id => 1, :id => nil})
      testier_client.save
      testy_client.delete
      expect(Client.all).to(eq([testier_client]))
    end
  end

  describe('#update') do
    it('will update an entry in the database') do
      test_client = Client.new({:name => "Ivan", :stylist_id => 1, :id => nil})
      test_client.save
      test_client.update(:name => "Brenda", :stylist_id => 2)
      expect(test_client.name).to(eq("Brenda"))
    end
  end

end
