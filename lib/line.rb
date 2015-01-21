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
    result = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method :== do |line|
    name == line.name && id == line.id
  end

  define_method :add_stop do |station|
  end

  define_method :list_stops do
  end
end
