require 'rest-client'
require 'json'

module FaxplusApi
  class Base
    def initialize(client)
      @client = client
      @access_token = client.access_token
      @base_url = client.base_url
    end

    def make_request(url:, data:, method: 'get', content_type: 'application/json')
      begin
        response =  if method == 'post'
                      RestClient.post(url, data, headers(content_type))
                    elsif method == 'put'
                      RestClient.put(url, data, headers(content_type))
                    elsif method == 'get'
                      RestClient.get(url, headers(content_type))
                    elsif method == 'delete'
                      RestClient.delete(url, headers(content_type))
                    end
      rescue RestClient::ExceptionWithResponse => e
        return { error: e.response.body }
      end

      return response.body if response.body.nil?

      JSON.parse(response.body, symbolize_names: true) rescue response.body
    end

    private

      def headers(content_type)
        {
          'Content-Type' => content_type,
          'Accept' => 'application/json',
          'Authorization' => "Bearer #{@access_token}"
        }
      end
  end
end