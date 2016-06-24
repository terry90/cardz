require 'rails_helper'

RSpec.describe "offer_reductions/edit", type: :view do
  before(:each) do
    @offer_reduction = assign(:offer_reduction, OfferReduction.create!(
      :name => "MyString",
      :percent => 1,
      :uid => "MyString",
      :location => nil,
      :description => "MyText",
      :title => "MyString"
    ))
  end

  it "renders the edit offer_reduction form" do
    render

    assert_select "form[action=?][method=?]", offer_reduction_path(@offer_reduction), "post" do

      assert_select "input#offer_reduction_name[name=?]", "offer_reduction[name]"

      assert_select "input#offer_reduction_percent[name=?]", "offer_reduction[percent]"

      assert_select "input#offer_reduction_uid[name=?]", "offer_reduction[uid]"

      assert_select "input#offer_reduction_location_id[name=?]", "offer_reduction[location_id]"

      assert_select "textarea#offer_reduction_description[name=?]", "offer_reduction[description]"

      assert_select "input#offer_reduction_title[name=?]", "offer_reduction[title]"
    end
  end
end