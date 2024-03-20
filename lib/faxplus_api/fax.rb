require_relative "base"

module FaxplusApi
  class Fax < Base
    def list(url: "#{@base_url}/accounts/%{user_id}/faxes", user_id:, data: {})
      url = url % {user_id: user_id}
      make_request(url: url, data: data)
    end

    def get(url: "#{@base_url}/accounts/%{user_id}/faxes/%{fax_id}", fax_id:, user_id:, data: {})
      url = url % {user_id: user_id, fax_id: fax_id}
      make_request(url: url, data: data)
    end

    def update(url: "#{@base_url}/accounts/%{user_id}/faxes/%{fax_id}", fax_id:, user_id:, data: {})
      url = url % {user_id: user_id, fax_id: fax_id}
      make_request(url: url, data: data, method: 'put')
    end

    def delete(url: "#{@base_url}/accounts/%{user_id}/faxes/%{fax_id}", fax_id:, user_id:, data: {})
      url = url % {user_id: user_id, fax_id: fax_id}
      make_request(url: url, data: data, method: 'delete')
    end
  end
end