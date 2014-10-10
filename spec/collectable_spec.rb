require 'spec_helper'
require 'collectable'

class Dummy
  include Collectable
end

class CharacteristicDummy
  include Collectable
end

class CharacteristicsDummy
  include Collectable
end

class CollectedDummy
  include Collectable
end

describe Collectable do
  let(:klass) {Collectable}

  context 'when included' do
    let(:dummy) {Dummy}

    it 'knows how to define characteristics' do
      expect(dummy).to respond_to(:characteristic)
    end

    it 'can report its tratis' do
      expect(dummy).to respond_to(:characteristics)
    end

    it 'knows how to collect the characteristics' do
      expect(dummy).to respond_to(:collected)
    end

    it 'knows what method gets a value for a collected characteristic' do
      expect(dummy).to respond_to(:value)
    end

    it 'knows what method gets a name for a collected characteristic' do
      expect(dummy).to respond_to(:name)
    end
  end

  describe '.value' do
    it 'is :value' do
      expect(Dummy.value).to eql(:value)
    end
  end

  describe '.name' do
    it 'is :name' do
      expect(Dummy.name).to eql(:name)
    end
  end

  describe '.characteristic' do
    let(:characteristic_dummy) {
      CharacteristicDummy
    }

    it 'can take a symbol' do
      expect {characteristic_dummy.characteristic :Blah}.not_to raise_error
    end

    it 'can take a string' do
      expect {characteristic_dummy.characteristic 'characteristic 2'}.
        not_to raise_error
    end

    it 'adds a characteristic to the collectable characteristics' do
      new_characteristic = :New_Characteristic
      characteristic_dummy.characteristic new_characteristic
      expect(characteristic_dummy.characteristics).
        to include(new_characteristic.to_s.downcase)
    end
  end

  describe '.characteristics' do
    let(:characteristics_dummy) {
      CharacteristicsDummy
    }

    let(:new_characteristic) {:new_characteristic}

    it 'is an array' do
      expect(characteristics_dummy.characteristics).to be_a(Array)
    end

    it 'contains the characteristics defined by the class' do
      expect(characteristics_dummy.characteristics).to be_empty

      characteristics_dummy.characteristic new_characteristic
      expect(characteristics_dummy.characteristics).
        to include(new_characteristic.to_s.downcase)
    end
  end

  describe '.collected' do
    let(:collected_dummy) {
      CollectedDummy
    }

    it 'is an array' do
      expect(collected_dummy.collected).to be_a(Array)
    end

    it 'contains OpenStruct representations of the known characteristics' do
      collected_dummy.characteristic :characteristic_1
      collected_dummy.characteristic :characteristic_2

      expect(collected_dummy.collected.map(&:name)).
        to eql(collected_dummy.characteristics.sort)
    end
  end
end
