require 'spec_helper'

describe 'Line' do
  describe '.all' do
    it 'lists all lines in the database' do
      test_line = Line.new({:name => 'Red Line', :id => nil})
      test_line.save
      test_line2 = Line.new({:name => 'Green Line', :id => nil})
      test_line2.save
      expect(Line.all).to eq [test_line, test_line2]
    end
  end
  describe '#save' do
    it 'lists all lines in the database' do
      test_line = Line.new({:name => 'Red Line', :id => nil})
      test_line.save
      expect(Line.all).to eq [test_line]
    end
  end
  describe '#==' do
    it 'makes two lines with the same name equivalent' do
      test_line = Line.new({:name => 'Red Line', :id => nil})
      test_line2 = Line.new({:name => 'Red Line', :id => nil})
      expect(test_line == test_line2).to eq true
    end
  end
  # describe '#add_stop' do
  #   it 'adds a stop to the line' do
  #     test_line = Line.new({:name => 'Red Line', :id => nil})
  #     test_line.save
  #     test_station = Station.new({:name => 'Rose Quarter', :id => nil})
  #     test_station.save
  #     test_line.add_stop(test_station)
  #     expect(test_line.list_stops).to eq [test_station]
  #   end
  # end
  # describe '#list_stops' do
  #   it 'lists all stops for the line' do
  #     test_line = Line.new({:name => 'Red Line', :id => nil})
  #     test_line.save
  #     test_station = Station.new({:name => 'Rose Quarter', :id => nil})
  #     test_station.save
  #     test_station2 = Station.new({:name => 'Pioneer Place', :id => nil})
  #     test_station2.save
  #     test_line.add_stop(test_station)
  #     expect(test_line.list_stops).to eq [test_station, test_station2]
  #   end
  # end
end
