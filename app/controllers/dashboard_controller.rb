class DashboardController < ApplicationController
  def index
    @athletes = User.all
  end
end
