require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:card) { build(:card) }

  it 'has a valid factory' do
    expect(build(:card)).to be_valid
  end

  describe 'ActiveModel validations' do
    describe 'uid' do
      it { expect(card).to allow_value('UX8ZJ3').for(:uid) }
      it { expect(card).not_to allow_value('').for(:uid) }
      it { expect(card).not_to allow_value('AOK2K').for(:uid) }
      it { expect(card).to validate_uniqueness_of(:uid).case_insensitive }
    end

    describe 'user' do
      it { expect(card).to allow_value(nil).for(:user) }
    end

    describe 'location' do
      it { expect(card).not_to allow_value(nil).for(:location) }
    end
  end

  describe '#generate_uid' do
    it 'should be called before a card creation' do
      expect(card).to receive(:generate_uid)
      card.save
    end

    it 'should generate a uid' do
      card.save
      expect(card.uid).not_to be_nil
    end
  end
end
