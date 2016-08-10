# Handles the request about home
class HomeController < ApplicationController
  # Displays a landing page with a sign-in form
  def index
    @user = User.new(email: params[:email])
  end
end
