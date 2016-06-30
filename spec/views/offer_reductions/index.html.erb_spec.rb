require 'rails_helper'

RSpec.describe "offer_reductions/index", type: :view do
  before(:each) do
    skip('Code me maybe')
    assign(:offer_reductions, [
      OfferReduction.create!(
        :name => "Name",
        :percent => 2,
        :uid => "Uid",
        :location => nil,
        :description => "MyText",
        :title => "Title"
      ),
      OfferReduction.create!(
        :name => "Name",
        :percent => 2,
        :uid => "Uid",
        :location => nil,
        :description => "MyText",
        :title => "Title"
      )
    ])
  end

  it "renders a list of offer_reductions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
