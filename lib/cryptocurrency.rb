require 'http'

module Cryptocurrency
    #only for top 100, by 24hr volume, could easily be updated to top 200
    def top10Gainers
        gainersLosers.first(10).to_h
    end

    #only for top 100, by 24hr volume, could easily be updated to top 200
    def top10Losers
        gainersLosers.last(10).reverse
    end

    def update_portfolio_data(coins_in_portfolio)
        data = {}
        ids = coins_in_portfolio.collect {|coin| coin.coin_id }
        quantities = coins_in_portfolio.collect {|coin| coin.quantity }
        #Coming through as an array at the moment
        ids.map.with_index {|id, index|
            response = HTTP.get("https://api.coinmarketcap.com/v2/ticker/#{id}/")
            parsed_response = JSON.parse(response.body)["data"]
            data[index] = {
                "name" => parsed_response["name"],
                "symbol" => parsed_response["symbol"],
                "price" => parsed_response["quotes"]["USD"]["price"],
                "change24h" => parsed_response["quotes"]["USD"]["percent_change_24h"],
                "quantity" => quantities[index]
            }
        }
        data
    end

    #Get the result => save it to the database with the quantity, use this to access real data
    def search(search_term)
        result = 0
        response = HTTP.get('https://api.coinmarketcap.com/v2/ticker/')
        parsed_response = JSON.parse(response.body)["data"]
        parsed_response.each {|k,v| 
            if v["symbol"] == search_term.upcase
                result = v["id"]
            end
        }
        result
    end

    private
    def gainersLosers
        response = HTTP.get('https://api.coinmarketcap.com/v2/ticker/?sort=volume_24&limit=100')
        parsed_response = JSON.parse(response.body)
        sorted_response = parsed_response["data"].sort_by {|k,v| -v["quotes"]["USD"]["percent_change_24h"]}
    end
end