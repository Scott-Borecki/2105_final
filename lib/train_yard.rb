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
      train.cargo.keys.each { |car| array << car.type }
    end.uniq.sort
  end

  def total_inventory
    trains.each_with_object(Hash.new(0)) do |train, hash|
      train.cargo.keys.each { |car| hash[car] += train.count_cars(car) }
    end
  end

  def car_on_only_one_train?(car)
    trains.one? { |train| train.cargo.keys.include?(car) }
  end

  def overflow_cars
    trains.each_with_object([]) do |train, array|
      train.cargo.keys.each do |car|
        array << car if (total_inventory[car] > 10) && (car_on_only_one_train?(car) == false)
      end
    end.uniq
  end

  def enough_in_stock?(car, quantity)
    total_inventory[car] > quantity
  end

  def unload(car, quantity)
    if enough_in_stock?(car, quantity) == true
      counter = quantity
      trains.each do |train|
        if train.cargo[car] > counter
          until counter == 0
            train.cargo[car] -= 1
            counter -= 1
          end
        elsif train.cargo[car] < counter
          until train.cargo[car] == 0
            train.cargo[car] -= 1
            counter -= 1
          end
        end
      end
      true
    else
      false
    end
  end
end
