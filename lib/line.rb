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

  define_singleton_method :find do |line_id|
    result = DB.exec("SELECT * FROM lines WHERE id = #{line_id};").first
    id = result.fetch("id").to_i
    name = result.fetch("name")
    Line.new({:id => id, :name => name})
  end

end
