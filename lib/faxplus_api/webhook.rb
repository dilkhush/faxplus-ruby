require_relative "base"

module FaxplusApi
  class Webhook < Base
    def list(url: "#{@base_url}/hooks", data: {})
      make_request(url: url, data: data)
    end

    def create(url: "#{@base_url}/hooks", data: {})
      make_request(url: url, data: data, method: 'post')
    end

    def delete(url: "#{@base_url}/hooks/%{hook_id}", hook_id:, data: {})
      url = url % {hook_id: hook_id}
      make_request(url: url, data: data, method: 'delete')
    end
  end
end