require 'rest-client'
require 'json'

module FaxplusApi
  class Base
    def initialize(client)
      @client = client
      @access_token = client.access_token
      @base_url = client.base_url
    end

    def make_request(url: , data: , method: 'get')
      begin
        response =  if method == 'post'
                      RestClient.post(url, data.to_json, headers)
                    elsif method == 'put'
                      RestClient.put(url, data.to_json, headers)
                    elsif method == 'get'
                      RestClient.get(url, headers)
                    elsif method == 'delete'
                      RestClient.delete(url, headers)
                    end
      rescue RestClient::ExceptionWithResponse => e
        return { error: e.response.body }
      end

      return response.body if response.body.nil?

      JSON.parse(response.body, symbolize_names: true) rescue response.body
    end

    private

      def headers
        {
          'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'Authorization' => "Bearer #{@access_token}"
        }
      end
  end
end