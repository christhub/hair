require('spec_helper')

describe(Stylist) do

  test_stylist = Stylist.new({:name => "Regali", :id => nil})

  describe('#clients') do
    it("will return a list of the stylist's clients") do
      test_stylist    = Stylist.new({:name => "Regali", :id => nil})
      test_stylist.save
      test_client     = Client.new({:name => "Ivan", :stylist_id => test_stylist.id, :id => nil})
      test_client.save
      test_client2    = Client.new({:name => "Regina", :stylist_id => test_stylist.id, :id => nil})
      test_client2.save
      expect(test_stylist.clients).to(eq([test_client, test_client2]))
    end
  end

  describe("#name") do
    it('will return the stylist name') do
      expect(test_stylist.name).to(eq("Regali"))
    end
  end

  describe("#id") do
    it('will return the stylist id') do
      testier_stylist = Stylist.new({:name => "Gru", :id => nil})
      expect(testier_stylist.id).to(eq(nil))
    end
  end

  describe(".all") do
    it('will return an empty array') do
      expect(Stylist.all).to(eq([]))
    end
  end

  describe("#save") do
    it('will save an entry to the database') do
      save_stylist = Stylist.new({:name => "Regali", :id => nil})
      save_stylist.save
      expect(Stylist.all).to(eq([save_stylist]))
    end
  end

  describe("#==") do
    it('will compare two objects to see if they are identical') do
      stylist1 = Stylist.new({:name => "Lucielle", :id => nil})
      stylist2 = Stylist.new({:name => "Lucielle", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it('will find a stylist based on an identifier') do
      find_stylist = Stylist.new({:name => "Gina", :id => 5})
      find_stylist.save
      expect(Stylist.find(find_stylist.id)).to(eq(find_stylist))
    end
  end

  describe("#update") do
    it('will update an entry in the database') do
      update_stylist = Stylist.new({:name => "Gina", :id => 5})
      update_stylist.save
      update_stylist.update(:name => "John")
      expect(update_stylist.name).to(eq("John"))
    end
  end

  describe("#delete") do
    it('will delete an entry from the database') do
      delete_stylist = Stylist.new({:name => "Gina", :id => 5})
      delete_stylist.save
      deleted_stylist = Stylist.new({:name => "Dar", :id => 5})
      deleted_stylist.save
      deleted_stylist.delete
      expect(Stylist.all).to(eq([delete_stylist]))
    end
  end

end
