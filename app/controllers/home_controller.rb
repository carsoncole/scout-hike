class HomeController < ApplicationController
  def index
    @users = User.order(miles_count: :desc).limit(15)
    @all_users = User.order(miles_count: :desc)
  end
end
