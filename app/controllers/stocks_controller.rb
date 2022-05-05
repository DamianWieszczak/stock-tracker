class StocksController < ApplicationController

  def find
    @stock = Stock.new_lookup(params[:stock])
    render 'users/my_market'
  end

end