# frozen_string_literal: true

require 'fresh_service/version'

module FreshService
  # Default configuration options for {Client}
  module Default
    class << self
      # Configuration options
      # @return [Hash]
      def options
        Hash[FreshService::Configurable.keys.map { |key| [key, send(key)] }]
      end

      # Default FreshService api_key from ENV
      # @return [String]
      def api_key
        ENV["FRESH_SERVICE_API_KEY"]
      end

      # Default ENV
      # @return [String]
      def env
        Rails.env
      end

      # Default BASE PACKAGE_URL
      # @return [String]
      def api_version_url
        "api/v2"
      end

      # Default user_agent
      # @return [String]
      def user_agent
        "freshservice-api-client-#{FreshService::VERSION}"
      end

      # Default api_endpoint FreshService URL for company
      # @return [String]
      def api_endpoint
        "https://#{organisation}.freshservice.com/#{api_version_url}"
      end

      # Default HTTP content_type
      # @return [String]
      def content_type
        "application/json"
      end

      def organisation
        ENV["FRESH_SERVICE_ORG"]
      end
    end
  end
end
