class UserStocksController < ApplicationController

  def create
    stock = Stock.check_db(params[:symbol])
    if stock.blank?
      stock = Stock.new_lookup(params[:symbol])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} was successfullu added to your market!"
    redirect_to my_market_path
  end

end
