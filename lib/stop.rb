class Stop
  attr_reader(:line, :station, :id)
  define_method :initialize do |attributes|
    @line = attributes.fetch(:line)
    @station = attributes.fetch(:station)
    @id = attributes.fetch(:id)
  end

  define_method :save do
    result = DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{@station.id}, #{@line.id}) RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  define_singleton_method :all do
    stops = []
    results = DB.exec("SELECT * FROM stops;")
    results.each do |stop|
      id = stop.fetch("id").to_i
      station_id = stop.fetch("station_id").to_i
      line_id = stop.fetch("line_id").to_i
      stops.push(Stop.new({:line => Line.find(line_id), :station => Station.find(station_id), :id => id}))
    end
    stops
  end

  define_method :== do |stop|
    line.==(stop.line) && station.==(stop.station)
  end
end
