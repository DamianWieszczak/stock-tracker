class UsersController < ApplicationController
  def my_market
    @tracked_stocks = current_user.stocks
  end
end
