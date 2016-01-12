require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it 'has a valid factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end

    it 'is invalid without a name' do
      expect(FactoryGirl.build(:user, name: nil)).not_to be_valid
    end
  end
end
