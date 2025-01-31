require_relative '../lib/car'
require_relative 'spec_helper'

RSpec.describe Car do
  before :each do
    @car1 = Car.new({type: 'Mail', weight: 5})
    @car2 = Car.new({type: 'Passengers', weight: 1})
  end

  describe 'Object Creation' do
    it 'exists' do
      expect(@car1).to be_an_instance_of(Car)

      expect(@car2).to be_an_instance_of(Car)
    end

    it 'has readable attributes' do
      expect(@car1.type).to eq('Mail')
      expect(@car1.weight).to eq(5)

      expect(@car2.type).to eq('Passengers')
      expect(@car2.weight).to eq(1)
    end
  end
end
