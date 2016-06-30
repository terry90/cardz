require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    skip 'Code me maybe'
    assign(:users, [
      User.create!(),
      User.create!()
    ])
  end

  it "renders a list of users" do
    render
  end
end
