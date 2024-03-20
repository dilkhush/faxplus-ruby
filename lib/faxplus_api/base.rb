require 'rest-client'
require 'json'

module FaxplusApi
  class Base
    def make_request(url: , data: , headers: , method: 'post')
      begin
        headers = default_headers.merge(headers)
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

      def default_headers
        {
          'Content-Type' => 'application/json',
          'Accept' => 'application/json'
        }
      end
  end
end