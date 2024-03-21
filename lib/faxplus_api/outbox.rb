require_relative "base"

module FaxplusApi
  class Outbox < Base
    def list(url: "#{@base_url}/accounts/%{user_id}/outbox", user_id:, data: {})
      url = url % {user_id: user_id}
      make_request(url: url, data: data)
    end

    def send(url: "#{@base_url}/accounts/%{user_id}/outbox", user_id:, data: {})
      url = url % {user_id: user_id}
      make_request(url: url, data: data, method: 'post')
    end

    def get(url: "#{@base_url}/accounts/%{user_id}/outbox/%{outbox_fax_id}", outbox_fax_id:, user_id:, data: {})
      url = url % {user_id: user_id, outbox_fax_id: outbox_fax_id}
      make_request(url: url, data: data)
    end

    def update(url: "#{@base_url}/accounts/%{user_id}/outbox/%{outbox_fax_id}", outbox_fax_id:, user_id:, data: {})
      url = url % {user_id: user_id, outbox_fax_id: outbox_fax_id}
      make_request(url: url, data: data, method: 'put')
    end

    def delete(url: "#{@base_url}/accounts/%{user_id}/outbox/%{outbox_fax_id}", outbox_fax_id:, user_id:, data: {})
      url = url % {user_id: user_id, outbox_fax_id: outbox_fax_id}
      make_request(url: url, data: data, method: 'delete')
    end
  end
end