class HomeController < ApplicationController
  def index
    @users = User.ranked.limit(15)
  end
end
