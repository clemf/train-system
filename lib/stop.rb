class Stop
  attr_reader(:line, :station)
  define_method :initialize do |attributes|
    @line = attributes.fetch(:line)
    @station = attributes.fetch(:station)
    @id = attributes.fetch(:id)
  end

  define_method :save do
  end

  # define_singleton_method :all do
  #   stops = []
  #   results = DB.exec("SELECT * FROM stops;")
  #   results.each do |stop|
  #     id = stop.fetch("id").to_i
  #     station_id = stop.fetch("station_id").to_i
  #     line_id = stop.fetch("line_id").to_i
  #     stops.push(Stop.new({:line => , :id => id}))
  #   end
  #   stations
  # end

end
