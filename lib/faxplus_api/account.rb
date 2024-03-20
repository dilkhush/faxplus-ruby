require_relative "base"

module ShipdayApi
  class Account < Base
    def initialize(client)
      @client = client
      @base_url = client.base_url
    end

    def accounts(url: "#{@base_url}/accounts", data: {}, headers: headers)
      make_request(url: url, data: data, headers: headers, method: 'get')
    end

    def user(url: "#{@base_url}/accounts/%{user_id}", user_id:, data: {}, headers: headers)
      url = url % {user_id: user_id}
      make_request(url: url, data: data, headers: headers, method: 'get')
    end

    def update_user(url: "#{@base_url}/accounts/%{user_id}", user_id:, data: {}, headers: headers)
      url = url % {user_id: user_id}
      make_request(url: url, data: data, headers: headers, method: 'put')
    end

    def member(url: "#{@base_url}/accounts/self/member-details/%{member_user_id}", member_user_id:, data: {}, headers: headers)
      url = url % {member_user_id: member_user_id}
      make_request(url: url, data: data, headers: headers, method: 'get')
    end

    def update_member(url: "#{@base_url}/accounts/self/member-details/%{member_user_id}", member_user_id:, data: {}, headers: headers)
      url = url % {member_user_id: member_user_id}
      make_request(url: url, data: data, headers: headers, method: 'put')
    end
  end
end