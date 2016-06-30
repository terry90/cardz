require 'rails_helper'

RSpec.describe "offer_reductions/new", type: :view do
  before(:each) do
    skip 'Code me maybe'
    assign(:offer_reduction, OfferReduction.new(
      :name => "MyString",
      :percent => 1,
      :uid => "MyString",
      :location => nil,
      :description => "MyText",
      :title => "MyString"
    ))
  end

  it "renders new offer_reduction form" do
    render

    assert_select "form[action=?][method=?]", offer_reductions_path, "post" do

      assert_select "input#offer_reduction_name[name=?]", "offer_reduction[name]"

      assert_select "input#offer_reduction_percent[name=?]", "offer_reduction[percent]"

      assert_select "input#offer_reduction_uid[name=?]", "offer_reduction[uid]"

      assert_select "input#offer_reduction_location_id[name=?]", "offer_reduction[location_id]"

      assert_select "textarea#offer_reduction_description[name=?]", "offer_reduction[description]"

      assert_select "input#offer_reduction_title[name=?]", "offer_reduction[title]"
    end
  end
end
