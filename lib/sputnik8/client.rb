# frozen_string_literal: true

require 'rest-client'
require 'json'

module Sputnik8
  class Client
    URL = 'https://api.sputnik8.com/v1'

    def initialize(apikey, username)
      @api_key = apikey
      @username = username
    end

    def activities(city_id)
      query('products', city_id)
    end

    def tags(id)
      query("cities/#{id}/categories")
    end

    def city(id)
      query("cities/#{id}")
    end

    def cities
      query('cities')
    end

    private

    def query(path, param_city_id = nil)
      response = RestClient::Request.execute(method: :get,
                                             url: "#{URL}/#{path}",
                                             headers: {
                                               params: { api_key: @api_key.to_s,
                                                         username: @username.to_s,
                                                         city_id: param_city_id.to_s },
                                               content_type: :json, accept: :json
                                             })
      verify_and_parse(response)
    end

    def verify_and_parse(response)
      response.code == 200 ? JSON.parse(response.body) : nil
    end
  end
end
