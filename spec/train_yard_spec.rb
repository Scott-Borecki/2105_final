require_relative '../lib/car'
require_relative '../lib/train'
require_relative '../lib/train_yard'

RSpec.describe TrainYard do
  before :each do
    @car1 = Car.new({type: 'Mail', weight: 5})
    @car2 = Car.new({type: 'Passengers', weight: 1})
    @car3 = Car.new({type: 'Cattle', weight: 3})
    @car4 = Car.new({type: 'Dining', weight: 4})

    @train1 = Train.new({name: 'Thomas', type: 'Tank'})
    @train2 = Train.new({name: 'Emily', type: 'Tender'})
    @train3 = Train.new({name: 'Nia', type: 'Tank'})
    @train4 = Train.new({name: 'Gordon', type: 'Express'})

    @train1.add_cars(@car1, 5)
    @train1.add_cars(@car2, 2)

    @train2.add_cars(@car1, 3)
    @train2.add_cars(@car4, 4)

    @train3.add_cars(@car1, 1)

    @train4.add_cars(@car4, 5)
    @train4.add_cars(@car3, 10)

    @train_yard = TrainYard.new({location: 'Brighton'})
  end

  describe 'Object Creation' do
    it 'exists' do
      expect(@train_yard).to be_an_instance_of(TrainYard)
    end

    it 'has readable attributes' do
      expect(@train_yard.location).to eq('Brighton')
      expect(@train_yard.trains).to eq([])
    end
  end

  describe 'Object Methods' do
    before :each do
      @train_yard.add_train(@train1)
      @train_yard.add_train(@train2)
      @train_yard.add_train(@train3)
      @train_yard.add_train(@train4)
    end
    it 'can add trains' do
      actual   = @train_yard.trains
      expected = [@train1, @train2, @train3, @train4]
      expect(actual).to eq(expected)
    end

    it 'can return the types of trains' do
      actual   = @train_yard.types_of_trains
      expected = ['Express', 'Tank', 'Tender']
      expect(actual).to eq(expected)
    end

    it 'can return the trains containing a type of car' do
      actual   = @train_yard.trains_containing(@car1)
      expected = [@train1, @train2, @train3]
      expect(actual).to eq(expected)
    end
  end
end
