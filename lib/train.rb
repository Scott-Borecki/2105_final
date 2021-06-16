class Train
  attr_reader :name,
              :type,
              :cargo

  def initialize(data)
    @name  = data[:name]
    @type  = data[:type]
    @cargo = Hash.new(0)
  end

  def count_cars(car)
    cargo[car]
  end

  def add_cars(car, num_cars)
    cargo[car] += num_cars
  end

  def weight
    cargo.sum { |(car, num_cars)| num_cars * car.weight }
  end
end
