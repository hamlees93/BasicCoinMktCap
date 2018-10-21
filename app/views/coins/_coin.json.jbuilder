json.extract! coin, :id, :name, :symbol, :price, :change24hr, :volume24hr, :created_at, :updated_at
json.url coin_url(coin, format: :json)
