require_relative "base"

module FaxplusApi
  class Account < Base
    def accounts(url: "#{@base_url}/accounts", data: {})
      make_request(url: url, data: data)
    end

    def user(url: "#{@base_url}/accounts/%{user_id}", user_id:, data: {})
      url = url % {user_id: user_id}
      make_request(url: url, data: data)
    end

    def update_user(url: "#{@base_url}/accounts/%{user_id}", user_id:, data: {})
      url = url % {user_id: user_id}
      make_request(url: url, data: data, method: 'put')
    end

    def member(url: "#{@base_url}/accounts/self/member-details/%{member_user_id}", member_user_id:, data: {})
      url = url % {member_user_id: member_user_id}
      make_request(url: url, data: data)
    end

    def update_member(url: "#{@base_url}/accounts/self/member-details/%{member_user_id}", member_user_id:, data: {})
      url = url % {member_user_id: member_user_id}
      make_request(url: url, data: data, method: 'put')
    end
  end
end