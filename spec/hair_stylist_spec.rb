require 'spec_helper'

describe 'Hair_stylist' do
  describe '#name' do
    it "return the name of the hair_stylist" do
      test_hair_stylist = Hair_stylist.new {name: 'Test', id: 1}
      expect(test_hair_stylist.name).to eq('Test')
    end
  end

  describe '#id' do
    it "returns the id of the hair_stylist" do
      test_hair_stylist = Hair_stylist.new {name: 'Test', id: 1}
      expect(test_hair_stylist.id).to eq(1)
    end
  end

  describe '#==' do
    it "compares 2 hair_stylist objects and decide that they are equal when both objects have same name and id" do
      test_hair_stylist = Hair_stylist.new {name: 'Test', id: 1}
      test_hair_stylist2 = Hair_stylist.new {name: 'Test', id: 1}
      expect(test_hair_stylist2).to eq(test_hair_stylist)
    end
  end

  describe '.all' do
    it "returns all hair_stylists" do
      expect(Hair_stylist.all).to eq([])
    end
  end

  describe '#save' do
    it "save hair_stylist into hair_stylists table" do
      test_hair_stylist = Hair_stylist.new {name: 'Test'}
      test_hair_stylist.save
      expect(Hair_stylist.all).to eq([test_hair_stylist])
    end
  end

  describe '.find_by_id' do
    it "returns hair_stylist with the inputted id" do
      test_hair_stylist = Hair_stylist.new {name: 'Test'}
      test_hair_stylist.save
      expect(Hair_stylist.find_by_id(test_hair_stylist.id)).to eq(test_hair_stylist)
    end
  end

  describe '#update' do
    it "updates hair_stylist's name in hair_stylists table" do
      test_hair_stylist = Hair_stylist.new {name: 'Test'}
      test_hair_stylist.save
      test_hair_stylist.update {name: 'Pass'}
      expect(Hair_stylist.all.first.name).to eq('Pass')
    end
  end

  describe '#delete' do
    it "deletes hair_stylist from hair_stylists table" do
      test_hair_stylist = Hair_stylist.new {name: 'Test'}
      test_hair_stylist.save
      test_hair_stylist.delete
      expect(Hair_stylist.all).to eq([])
    end
  end
end
