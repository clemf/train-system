class Stop
  attr_reader(:line, :station)
  define_method :initialize do |attributes|
    @line = attributes.fetch(:line)
    @station = attributes.fetch(:station)
  end

  define_method :save do
  end

  define_singleton_method :all do
  end

end
