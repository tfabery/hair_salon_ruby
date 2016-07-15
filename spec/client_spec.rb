require 'spec_helper'

describe 'Client' do
  describe '#name' do
    it "return the name of the client" do
      test_client = Client.new {name: 'Test', id: 1}
      expect(test_client.name).to eq('Test')
    end
  end

  describe '#id' do
    it "returns the id of the client" do
      test_client = Client.new {name: 'Test', id: 1}
      expect(test_client.id).to eq(1)
    end
  end

  describe '#==' do
    it "compares 2 client objects and decide that they are equal when both objects have same name and id" do
      test_client = Client.new {name: 'Test', id: 1}
      test_client2 = Client.new {name: 'Test', id: 1}
      expect(test_client2).to eq(test_client)
    end
  end

  describe '.all' do
    it "returns all clients" do
      expect(Client.all).to eq([])
    end
  end

  describe '#save' do
    it "save client into clients table" do
      test_client = Client.new {name: 'Test'}
      test_client.save
      expect(Client.all).to eq([test_client])
    end
  end

  describe '.find_by_id' do
    it "returns client with the inputted id" do
      test_client = Client.new {name: 'Test'}
      test_client.save
      expect(Client.find_by_id(test_client.id)).to eq(test_client)
    end
  end
end
