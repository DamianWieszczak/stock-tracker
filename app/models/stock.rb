class Stock < ApplicationRecord
has_many :user_stocks
has_many :users, through: :user_stocks

validates :name, :symbol, presence: true

  def self.new_lookup(stock_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      new(symbol: stock_symbol, name: client.company(stock_symbol).company_name, latest_price: client.price(stock_symbol))
    rescue => exception
      return nil
    end
  end
  
end
