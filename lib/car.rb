class Car
  attr_reader :type,
              :weight

  def initialize(data)
    @type   = data[:type]
    @weight = data[:weight]
  end
end
