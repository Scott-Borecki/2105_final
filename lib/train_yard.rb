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

  def sorted_cargo_list
    trains.each_with_object([]) do |train, array|
      train.cargo.keys.each do |car|
        array << car.type
      end
    end.uniq.sort
  end

  def total_inventory
    trains.each_with_object(Hash.new(0)) do |train, hash|
      train.cargo.keys.each do |car|
        hash[car] += train.count_cars(car)
      end
    end
  end

  def car_on_only_one_train?(car)
    trains.one? do |train|
      train.cargo.keys.include?(car)
    end
  end

  def overflow_cars
    trains.each_with_object([]) do |train, array|
      train.cargo.keys.each do |car|
        array << car if (total_inventory[car] > 10) && (car_on_only_one_train?(car) == false)
      end
    end.uniq
  end
end
