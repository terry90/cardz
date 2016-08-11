require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) { build(:location) }

  it 'has a valid factory' do
    expect(build(:location)).to be_valid
  end

  describe 'ActiveModel validations' do
    describe 'name' do
      it { expect(location).to allow_value('Château de mes ancêtres').for(:name) }
      it { expect(location).not_to allow_value('').for(:name) }
    end

    describe 'lng' do
      it { expect(location).to allow_value(-23).for(:lng) }
      it { expect(location).not_to allow_value(nil).for(:lng) }
    end

    describe 'lat' do
      it { expect(location).to allow_value(182).for(:lat) }
      it { expect(location).not_to allow_value(nil).for(:lat) }
    end

    describe 'business' do
      it { expect(location).not_to allow_value(nil).for(:business) }
    end
  end
end
