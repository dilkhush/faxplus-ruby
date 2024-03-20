require_relative "base"

module ShipdayApi
  class Fax < Base
    def initialize(client)
      @client = client
      @base_url = client.base_url
    end

    def list(url: "#{@base_url}/accounts/%{user_id}/faxes", user_id:, data: {}, headers: headers)
      url = url % {user_id: user_id}
      make_request(url: url, data: data, headers: headers, method: 'get')
    end

    def get(url: "#{@base_url}/accounts/%{user_id}/faxes/%{fax_id}", fax_id:, user_id:, data: {}, headers: headers)
      url = url % {user_id: user_id, fax_id: fax_id}
      make_request(url: url, data: data, headers: headers, method: 'get')
    end

    def update(url: "#{@base_url}/accounts/%{user_id}/faxes/%{fax_id}", fax_id:, user_id:, data: {}, headers: headers)
      url = url % {user_id: user_id, fax_id: fax_id}
      make_request(url: url, data: data, headers: headers, method: 'put')
    end

    def delete(url: "#{@base_url}/accounts/%{user_id}/faxes/%{fax_id}", fax_id:, user_id:, data: {}, headers: headers)
      url = url % {user_id: user_id, fax_id: fax_id}
      make_request(url: url, data: data, headers: headers, method: 'delete')
    end
  end
end