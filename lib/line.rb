class Line
  attr_reader(:name, :id)

  define_method :initialize do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method :all do
    lines = []
    results = DB.exec("SELECT * FROM lines;")
    results.each do |line|
      id = line.fetch("id").to_i
      name = line.fetch("name")
      lines.push(Line.new({:name => name, :id => id}))
    end
    lines
  end

  define_method :save do
    results_id = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = results_id.first().fetch("id").to_i()
  end

  define_method :== do |line|
    name == line.name && id == line.id
  end

  # define_method :add_stop do |station|
  #   DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{station.id}, #{@id});")
  # end
  #
  # define_method :list_stops do
  #   stops = []
  #   stop_results = DB.exec("SELECT * FROM stops WHERE line_id = #{@id};")
  #   stop_results.each do |stop|
  #     station_id = stop.fetch("station_id")
  #     station_results = DB.exec("SELECT * FROM stations WHERE station_id = #{station_id}")
  #     station_results.each do |station|
  #       name = station.fetch("name")
  #       id = station.fetch("id").to_i
  #       stops.push(Station.new({:name => name, :id => id}))
  #     end
  #   end
  #   stops
  # end

end
