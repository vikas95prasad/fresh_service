# frozen_string_literal: true

require "fresh_service/client"
require "fresh_service/default"

# Ruby toolkit for the FreshService API
module FreshService
  class << self
    include FreshService::Configurable

    # API client based on configured options {Configurable}
    #
    # @return [FreshService::Client] API wrapper
    def client
      return @client if defined?(@client) && @client.same_options?(options)

      @client = FreshService::Client.new(options)
    end
  end
end

FreshService.setup
