require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    skip 'Code me maybe'
    @user = assign(:user, User.create!())
  end

  it "renders the edit user form" do
    skip 'Code me maybe'
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do
    end
  end
end
