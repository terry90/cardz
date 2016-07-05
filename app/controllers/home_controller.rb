class HomeController < ApplicationController
  def index
    @user = User.new(email: params[:email])
  end
end
