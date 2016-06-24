require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:card) { create(:card) }

  it { expect(card.uid).not_to be_nil }
end
