require 'rails_helper'

RSpec.describe Business, type: :model do
  let(:business) { build(:business) }

  it 'has a valid factory' do
    expect(build(:business)).to be_valid
  end

  describe 'ActiveModel validations' do
    describe 'name' do
      it { expect(business).to allow_value('Association des Châteaux de Paris').for(:name) }
      it { expect(business).not_to allow_value('').for(:name) }
      it { expect(business).to validate_uniqueness_of(:name).case_insensitive }
    end

    describe 'locations' do
      it { expect(business).to allow_value([]).for(:locations) }
    end
  end
end
