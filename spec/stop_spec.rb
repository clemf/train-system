require 'spec_helper'

describe 'Stop' do
  describe '#save' do
    it 'saves the stop to the database' do
      test_line = Line.new({:name => 'Red Line', :id => nil})
      test_line.save
      test_station = Station.new({:name => 'Rose Quarter', :id => nil})
      test_station.save
      test_stop = Stop.new({:line => test_line, :station => test_station})
      test_stop.save
      expect(Stop.all()).to(eq([test_stop]))
    end
  end

  describe '.all' do
    it 'lists all of the stops' do
      test_line = Line.new({:name => 'Red Line', :id => nil})
      test_line.save
      test_station = Station.new({:name => 'Rose Quarter', :id => nil})
      test_station.save
      test_stop = Stop.new({:line => test_line, :station => test_station})
      test_stop.save
      test_line2 = Line.new({:name => 'Green Line', :id => nil})
      test_line2.save
      test_station2 = Station.new({:name => 'Rose Quarter', :id => nil})
      test_station2.save
      test_stop2 = Stop.new({:line => test_line, :station => test_station})
      test_stop2.save
      expect(Stop.all()).to(eq([test_stop, test_stop2]))
    end
  end

  describe '#==' do
    it 'makes two stops with the same attributes equivalent' do
      test_line = Line.new({:name => 'Red Line', :id => nil})
      test_line.save
      test_station = Station.new({:name => 'Rose Quarter', :id => nil})
      test_station.save
      test_stop = Stop.new({:line => test_line, :station => test_station})
      test_stop.save
      test_stop2 = Stop.new({:line => test_line, :station => test_station})
      expect(test_stop == test_stop2).to eq true
    end
  end
end
