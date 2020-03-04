require 'httparty'
require 'json'

class Kudos
    def initialize
        @api_url = ENV["ECS_CLI_LB_DNS"]
    end

    def contributions(user)
        puts "http://#{@api_url}/api/kudos/#{user}"
        response = HTTParty.get("http://#{@api_url}/api/kudos/#{user}")
        JSON.parse(response.body)
    end
end
