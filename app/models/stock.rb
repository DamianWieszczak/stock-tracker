class Stock < ApplicationRecord

  def self.new_lookup(stock_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    new(symbol: stock_symbol, name: client.company(stock_symbol).company_name, latest_price: client.price(stock_symbol))
  end

end
