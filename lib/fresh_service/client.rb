# frozen_string_literal: true

require "fresh_service/default"
require "fresh_service/connection"
require "fresh_service/configurable"
require "fresh_service/client/v2/ticket/create"
require "fresh_service/client/v2/ticket/update"
require "fresh_service/client/v2/ticket/view"
require "fresh_service/client/v2/group/create"
require "fresh_service/client/v2/group/view"
require "fresh_service/client/v2/service_request/create"
require "fresh_service/client/v2/service_request/update"
require "fresh_service/error"

module FreshService
  # Client for the FreshService API
  #
  # @see https://api.freshservice.com/
  class Client
    include FreshService::Default
    include FreshService::Connection
    include FreshService::Configurable
    include FreshService::Client::V2::Ticket::Create
    include FreshService::Client::V2::Ticket::Update
    include FreshService::Client::V2::Ticket::View
    include FreshService::Client::V2::Group::Create
    include FreshService::Client::V2::Group::View
    include FreshService::Client::V2::ServiceRequest::Create
    include FreshService::Client::V2::ServiceRequest::Update

    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      FreshService::Configurable.keys.each do |key|
        value = options.key?(key) ? options[key] : FreshService.instance_variable_get(:"@#{key}")
        value = value.presence || FreshService::Default.send(:"#{key}")
        instance_variable_set(:"@#{key}", value)
      end
    end
  end
end
