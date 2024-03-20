require_relative "base"

module FaxplusApi
  class Number < Base
    def list(url: "#{@base_url}/accounts/%{user_id}/numbers", user_id:, data: {})
      url = url % {user_id: user_id}
      make_request(url: url, data: data)
    end

    def get(url: "#{@base_url}/accounts/%{user_id}/numbers/%{number}", user_id:, number:, data: {})
      url = url % {user_id: user_id, number: number}
      make_request(url: url, data: data)
    end

    def update(url: "#{@base_url}/accounts/%{user_id}/numbers/%{number}", user_id:, number:, data: {})
      url = url % {user_id: user_id, number: number}
      make_request(url: url, data: data, method: 'put')
    end

    def revoke(url: "#{@base_url}/accounts/%{user_id}/numbers/%{number}", user_id:, number:, data: {})
      url = url % {user_id: user_id, number: number}
      make_request(url: url, data: data, method: 'delete')
    end
  end
end