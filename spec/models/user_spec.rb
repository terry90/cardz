require 'rails_helper'

RSpec.describe User, type: :model do
  let(:card) { create(:card) }
  let(:user) { create(:user, cards: [card]) }

  it 'has a valid factory (adding a card)' do
    expect(build(:user, cards: [card])).to be_valid
  end

  describe 'ActiveModel validations' do
    it { expect(user).to allow_value('dhh@nonopinionated.com').for(:email) }
    it { expect(user).not_to allow_value('base@example').for(:email) }
    it { expect(user).not_to allow_value('').for(:email) }

    it 'validates country by alpha2' do
      skip('No country system yet')
      user.country = 'FR'
      user.save
      expect(user.errors.messages).to be_empty
    end

    it 'does not validate country by alpha2' do
      skip('No country system yet')
      user.country = 'Zimbabwelele'
      user.save
      expect(user.errors.messages).to_not be_empty
    end

    it 'validates birth date' do
      user.birthday = Date.current - 90.years
      user.save
      expect(user.errors.messages).to be_empty
    end

    it 'does not validate birth date' do
      skip('No birthday system yet')
      user.birthday = Date.current - 130.years
      user.save
      expect(user.errors.messages).to_not be_empty
    end
  end

  describe '#password_required?' do
    context 'when user is confirmed' do
      before do
        allow(user).to receive('confirmed?') { true }
      end

      it 'should return true' do
        expect(user.password_required?).to eq true
      end
    end

    context 'when user is not confirmed' do
      before do
        allow(user).to receive('confirmed?') { false }
      end

      it 'should return false' do
        expect(user.password_required?).to eq false
      end
    end
  end

  describe '#full_name' do
    it 'should return full name' do
      expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
    end
  end

  describe '#completion_percentage' do
    it 'should return an integer' do
      expect(user.completion_percentage).to be_an Integer
    end
  end

  describe '#offers_by_location' do
    it 'should return a hash' do
      expect(user.offers_by_location).to be_a Hash
    end

    it 'should have as many key as cards user owns' do
      expect(user.offers_by_location.count).to eq 1
      user.cards = [card, build(:card)]
      expect(user.offers_by_location.count).to eq 2
    end
  end

  describe '#add_complete_notif' do
    it 'should create a new notif for user' do
      expect { user.send(:add_complete_notif) }.to change { user.notifs.count }.by 1
    end

    it 'should be called at user creation' do
      new_user = build(:user, cards: [card])
      expect(new_user).to receive(:add_complete_notif)
      new_user.save
    end
  end
end
