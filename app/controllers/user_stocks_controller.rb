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

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    user_stock.destroy
    flash[:notice] = "#{stock.symbol} was successfully removed from your market"
    redirect_to my_market_path
  end
end
