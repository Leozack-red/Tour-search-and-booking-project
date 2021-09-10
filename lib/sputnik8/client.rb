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

    def activities
      response_activities = RestClient::Request.execute(method: :get,
                                                        url: "#{URL}/products",
                                                        headers: {
                                                          params: { api_key: @api_key.to_s, username: @username.to_s },
                                                          content_type: :json, accept: :json
                                                        })

      verify_and_parse(response_activities)
    end

    def tags(id)
      response_tags = RestClient::Request.execute(method: :get,
                                                  url: "#{URL}/cities/#{id}/categories",
                                                  headers: {
                                                    params: { api_key: @api_key.to_s, username: @username.to_s },
                                                    content_type: :json, accept: :json
                                                  })
      verify_and_parse(response_tags)
    end

    def cities(id)
      response_cities = RestClient::Request.execute(method: :get,
                                                    url: "#{URL}/cities/#{id}",
                                                    headers: {
                                                      params: { api_key: @api_key.to_s, username: @username.to_s },
                                                      content_type: :json, accept: :json
                                                    })
      verify_and_parse(response_cities)
    end

    def verify_and_parse(response)
      response.code == 200 ? JSON.parse(response.body) : nil
    end
  end
end
