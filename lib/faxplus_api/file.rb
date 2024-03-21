require_relative "base"

module FaxplusApi
  class File < Base
    def upload(url: "#{@base_url}/accounts/%{user_id}/files", user_id:, data: {})
      url = url % {user_id: user_id}
      make_request(url: url, data: data, method: 'post', content_type: 'multipart/form-data')
    end

    def get(url: "#{@base_url}/accounts/%{user_id}/files/%{fax_id}", user_id:, fax_id:, data: {})
      url = url % {user_id: user_id, fax_id: fax_id}
      make_request(url: url, data: data)
    end

    def fax_report(url: "#{@base_url}/accounts/%{user_id}/report/%{fax_id}", user_id:, fax_id:, data: {})
      url = url % {user_id: user_id, fax_id: fax_id}
      make_request(url: url, data: data)
    end
  end
end