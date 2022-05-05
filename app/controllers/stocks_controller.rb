class StocksController < ApplicationController

  def find
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render 'users/my_market'
      else
        flash[:alert] = "Please enter a valid symbol to find"
        redirect_to my_market_path
      end
    else
      flash[:alert] = "Please enter a company symbol to find"
      redirect_to my_market_path
    end
  end

end