require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    skip 'Code me maybe'
    @location = assign(:location, Location.create!())
  end

  it "renders the edit location form" do
    skip 'Code me maybe'
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do
    end
  end
end
