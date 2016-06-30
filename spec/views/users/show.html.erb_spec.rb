require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    skip 'Code me maybe'
    @user = assign(:user, User.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
