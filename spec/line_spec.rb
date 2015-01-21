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
  describe '.find' do
    it 'takes a line id and returns the object' do
      test_line = Line.new({:name => 'Red Line', :id => nil})
      test_line.save
      test_line2 = Line.new({:name => 'Green Line', :id => nil})
      test_line2.save
      expect(Line.find(test_line.id)).to eq test_line
    end
  end
end
