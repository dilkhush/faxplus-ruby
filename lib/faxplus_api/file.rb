require_relative "base"

module ShipdayApi
  class File < Base
    def initialize(client)
      @client = client
      @base_url = client.base_url
    end

    def upload(url: "#{@base_url}/accounts/%{user_id}/files", user_id:, data: {}, headers: headers)
      url = url % {user_id: user_id}
      make_request(url: url, data: data, headers: headers, method: 'post')
    end

    def get(url: "#{@base_url}/accounts/%{user_id}/files/%{fax_id}", user_id:, fax_id:, data: {}, headers: headers)
      url = url % {user_id: user_id, fax_id: fax_id}
      make_request(url: url, data: data, headers: headers, method: 'get')
    end

    def fax_report(url: "#{@base_url}/accounts/%{user_id}/report/%{fax_id}", user_id:, fax_id:, data: {}, headers: headers)
      url = url % {user_id: user_id, fax_id: fax_id}
      make_request(url: url, data: data, headers: headers, method: 'get')
    end
  end
end