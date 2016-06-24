require 'rails_helper'

RSpec.describe "offer_reductions/show", type: :view do
  before(:each) do
    @offer_reduction = assign(:offer_reduction, OfferReduction.create!(
      :name => "Name",
      :percent => 2,
      :uid => "Uid",
      :location => nil,
      :description => "MyText",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Uid/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Title/)
  end
end
