require 'spec_helper'
require 'collectable'

class Dummy
  include Collectable
end

class TraitDummy
  include Collectable
end

class TraitsDummy
  include Collectable
end

class CollectedDummy
  include Collectable
end

describe Collectable do
  let(:klass) {Collectable}

  context 'when included' do
    let(:dummy) {Dummy}

    it 'knows how to define traits' do
      expect(dummy).to respond_to(:trait)
    end

    it 'can report its tratis' do
      expect(dummy).to respond_to(:traits)
    end

    it 'knows how to collect the traits' do
      expect(dummy).to respond_to(:collected)
    end
  end

  describe '.trait' do
    let(:trait_dummy) {
      TraitDummy
    }

    it 'can take a symbol' do
      expect {trait_dummy.trait :Blah}.not_to raise_error
    end

    it 'can take a string' do
      expect {trait_dummy.trait 'Trait 2'}.not_to raise_error
    end

    it 'adds a trait to the collectable traits' do
      new_trait = :New_Trait
      trait_dummy.trait new_trait
      expect(trait_dummy.traits).to include(new_trait.to_s.downcase)
    end
  end

  describe '.traits' do
    let(:traits_dummy) {
      TraitsDummy
    }

    let(:new_trait) {:new_trait}

    it 'is an array' do
      expect(traits_dummy.traits).to be_a(Array)
    end

    it 'contains the traits defined by the class' do
      expect(traits_dummy.traits).to be_empty

      traits_dummy.trait new_trait
      expect(traits_dummy.traits).to include(new_trait.to_s.downcase)
    end
  end

  describe '.collected' do
    let(:collected_dummy) {
      CollectedDummy
    }

    it 'is an array' do
      expect(collected_dummy.collected).to be_a(Array)
    end

    it 'contains OpenStruct representations of the known traits' do
      collected_dummy.trait :trait_1
      collected_dummy.trait :trait_2

      expect(collected_dummy.collected.map(&:name)).
        to eql(collected_dummy.traits.sort)
    end
  end
end
