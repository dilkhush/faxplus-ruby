require_relative "base"

module ShipdayApi
  class Webhook < Base
    def initialize(client)
      @client = client
      @base_url = client.base_url
    end

    def list(url: "#{@base_url}/hooks", data: {}, headers: headers)
      make_request(url: url, data: data, headers: headers, method: 'get')
    end

    def create(url: "#{@base_url}/hooks", data: {}, headers: headers)
      make_request(url: url, data: data, headers: headers, method: 'post')
    end

    def delete(url: "#{@base_url}/hooks/%{hook_id}", hook_id:, data: {}, headers: headers)
      url = url % {hook_id: hook_id}
      make_request(url: url, data: data, headers: headers, method: 'delete')
    end
  end
end