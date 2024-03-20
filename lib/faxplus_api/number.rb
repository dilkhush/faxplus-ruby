require_relative "base"

module ShipdayApi
  class Number < Base
    def initialize(client)
      @client = client
      @base_url = client.base_url
    end

    def list(url: "#{@base_url}/accounts/%{user_id}/numbers", user_id:, data: {}, headers: headers)
      url = url % {user_id: user_id}
      make_request(url: url, data: data, headers: headers, method: 'get')
    end

    def get(url: "#{@base_url}/accounts/%{user_id}/numbers/%{number}", user_id:, number:, data: {}, headers: headers)
      url = url % {user_id: user_id, number: number}
      make_request(url: url, data: data, headers: headers, method: 'get')
    end

    def update(url: "#{@base_url}/accounts/%{user_id}/numbers/%{number}", user_id:, number:, data: {}, headers: headers)
      url = url % {user_id: user_id, number: number}
      make_request(url: url, data: data, headers: headers, method: 'put')
    end

    def revoke(url: "#{@base_url}/accounts/%{user_id}/numbers/%{number}", user_id:, number:, data: {}, headers: headers)
      url = url % {user_id: user_id, number: number}
      make_request(url: url, data: data, headers: headers, method: 'delete')
    end
  end
end