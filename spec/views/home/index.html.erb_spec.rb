require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  include ActionView::Helpers

  before(:each) do
    #assign(:project, project)
    #assign(:donations, project.donations.includes(:user).isvalid.order('created_at DESC').page(params[:page]).per(10))
    #controller.request.path_parameters[:id] = project.id
    #params[:tab] = tab
  end

  it 'should render an email input' do
    skip('Routes undefined ??')
    render
    expect(rendered).to have_selector('input.email-input')
  end

  it 'should render a button to check the email' do
    skip('Routes undefined ??')
    render
    expect(rendered).to have_selector('button.check-email')
  end
end
