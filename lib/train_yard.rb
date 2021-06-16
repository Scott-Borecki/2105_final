class TrainYard
  attr_reader :location,
              :trains

  def initialize(data)
    @location = data[:location]
    @trains   = []
  end

  def add_train(train)
    trains << train
  end

  def types_of_trains
    trains.map { |train| train.type }.uniq.sort
  end

  def trains_containing(car)
    trains.find_all { |train| train.cargo.keys.include?(car) }
  end
end
