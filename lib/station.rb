class Station
  attr_reader(:name, :id)

  define_method :initialize do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method :all do
    stations = []
    results = DB.exec("SELECT * FROM stations;")
    results.each do |station|
      id = station.fetch("id").to_i
      name = station.fetch("name")
      stations.push(Station.new({:name => name, :id => id}))
    end
    stations
  end

  define_method :save do
    results_id = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = results_id.first().fetch("id").to_i()
  end

  define_method :== do |station|
    name == station.name && id == station.id
  end
end
