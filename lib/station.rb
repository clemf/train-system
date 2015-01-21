class Station
  attr_reader(:name)

  define_method :initialize do |attributes|
    @name = attributes.fetch(:name)
  end

  define_singleton_method :all do
    stations = []
    results = DB.exec("SELECT * FROM stations;")
    results.each do |station|
      name = station.fetch("name")
      stations.push(Station.new({:name => name}))
    end
    stations
  end

  define_method :save do
    DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING ID;")
  end

  define_method :== do |station|
    name.==(station.name)
  end
end
