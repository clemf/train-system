require 'spec_helper'

describe 'Station' do
  describe '.all' do
    it 'lists all stations in the database' do
      test_station = Station.new('Rose Quarter')
      test_station.save
      test_station2 = Station.new('Pioneer Place')
      test_station.save
      expect(Station.all).to eq [test_station, test_station2]
    end
  end
  describe '#save' do
    it 'lists all stations in the database' do
      test_station = Station.new('Rose Quarter')
      test_station.save
      expect(Station.all).to eq [test_station]
    end
  end
  describe '#==' do
    it 'makes two stations with the same name equivalent' do
      test_station = Station.new('Rose Quarter')
      test_station2 = Station.new('Rose Quarter')
      expect(test_station == test_station2).to eq true
    end
  end
end
