require 'http'

module Cryptocurrency
    def portfolio
    end

    #only for top 100, by 24hr volume, could easily be updated to top 200
    def top10Gainers
        gainersLosers.first(10).to_h
    end

    #only for top 100, by 24hr volume, could easily be updated to top 200
    def top10Losers
        gainersLosers.last(10).reverse
    end

    def tracking
    end

    def search(search_term)
        response = HTTP.get('https://api.coinmarketcap.com/v2/ticker/')
        parsed_response = JSON.parse(response.body)["data"]
        sorted_response = parsed_response["data"]
        sorted_response.each {|k,v| 
          if v["name"] == search_term
            data = [
                v["name"], 
                v["symbol"], 
                v["price"],
                number_to_percentage((v["quotes"]["USD"]["percent_change_24h"]), precision: 2),
                number_to_currency(v["quotes"]["USD"]["volume_24h"])
            ]
          end
        }
        data
    end

    private
    def gainersLosers
        response = HTTP.get('https://api.coinmarketcap.com/v2/ticker/?sort=volume_24&limit=100')
        parsed_response = JSON.parse(response.body)
        sorted_response = parsed_response["data"].sort_by {|k,v| -v["quotes"]["USD"]["percent_change_24h"]}
    end
end