require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe "validations" do
    it 'has a valid factory' do
      expect(FactoryGirl.create(:pet)).to be_valid
    end

    it 'is invalid without a name' do
      expect(FactoryGirl.build(:pet, name: nil)).not_to be_valid
    end

    it 'is invalid without a species' do
      expect(FactoryGirl.build(:pet, species: nil)).not_to be_valid
    end

    it 'is invalid if the age is not a number' do
      expect(FactoryGirl.build(:pet, age: 'dos')).not_to be_valid
    end

    it 'is invalid if the age is not a integer' do
      expect(FactoryGirl.build(:pet, age: 1.2)).not_to be_valid
    end

    it 'is invalid if the age is not greater than -1' do
      expect(FactoryGirl.build(:pet, age: -1)).not_to be_valid
    end
  end
end
