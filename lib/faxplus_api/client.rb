require_relative "account"
require_relative "file"
require_relative "fax"
require_relative "outbox"
require_relative "number"
require_relative "webhook"

BASE_URL = "https://restapi.fax.plus/v3"

module FaxplusApi
  class Client

    attr_reader :access_token, :base_url

    def initialize(access_token: ENV['FAXPLUS_PAT_TOKEN'])
      @access_token = access_token
      @base_url = BASE_URL
    end

    def file(params = {}, headers: headers)
      @file ||= File.new(self)
    end

    def account(params = {}, headers: headers)
      @account ||= Account.new(self)
    end

    def fax(params = {}, headers: headers)
      @fax ||= Fax.new(self)
    end

    def number(params = {}, headers: headers)
      @number ||= Number.new(self)
    end

    def outbox(params = {}, headers: headers)
      @outbox ||= Outbox.new(self)
    end

    def webhook(params = {}, headers: headers)
      @webhook ||= Webhook.new(self)
    end

    private

      def headers
        {'Authorization' => "Bearer #{@access_token}"}
      end
  end
end
