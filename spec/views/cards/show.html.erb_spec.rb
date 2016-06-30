require 'rails_helper'

RSpec.describe "cards/show", type: :view do
  before(:each) do
    skip 'Code me maybe'
    @card = assign(:card, Card.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
