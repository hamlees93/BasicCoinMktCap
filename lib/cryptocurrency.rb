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

    private
    def gainersLosers
        response = HTTP.get('https://api.coinmarketcap.com/v2/ticker/?sort=volume_24&limit=100')
        parsed_response = JSON.parse(response.body)
        sorted_response = parsed_response["data"].sort_by {|k,v| -v["quotes"]["USD"]["percent_change_24h"]}
    end
end