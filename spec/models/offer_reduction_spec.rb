require 'rails_helper'

RSpec.describe OfferReduction, type: :model do
  let(:offer_reduction) { build(:offer_reduction) }

  it 'has a valid factory' do
    expect(build(:offer_reduction)).to be_valid
  end

  describe 'ActiveModel validations' do
    describe 'uid' do
      it { expect(offer_reduction).to allow_value('UX8ZJ3').for(:uid) }
      it { expect(offer_reduction).not_to allow_value('').for(:uid) }
      it { expect(offer_reduction).not_to allow_value('AOK2K').for(:uid) }
      it { expect(offer_reduction).to validate_uniqueness_of(:uid).case_insensitive }
    end

    describe 'name' do
      it { expect(offer_reduction).to allow_value('30% off on the whole shop').for(:name) }
      it { expect(offer_reduction).not_to allow_value('').for(:name) }
    end

    describe 'location' do
      it { expect(offer_reduction).not_to allow_value(nil).for(:location) }
    end
  end
end
