class UsersController < ApplicationController
  
  def my_market
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end

  def find
    render json: params[:friend]
  end

end
