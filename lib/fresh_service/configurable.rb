# frozen_string_literal: true

module FreshService
  # Configuration options for {Client}, defaulting to values
  # in {Default}
  module Configurable
    attr_accessor :organisation, :env, :api_key, :content_type,
      :api_endpoint, :user_agent

    class << self
      # List of configurable keys for {FreshService::Client}
      # @return [Array] of option keys
      def keys
        @keys ||= %i[
          organisation
          env
          api_key
          content_type
          api_endpoint
          user_agent
        ]
      end
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    # Reset configuration options to default values
    def reset!
      FreshService::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", FreshService::Default.options[key])
      end
      self
    end
    alias setup reset!

    # Compares client options to a Hash of requested options
    #
    # @param opts [Hash] Options to compare with current client options
    # @return [Boolean]
    def same_options?(opts)
      opts.hash == options.hash
    end

    private

      def options
        Hash[FreshService::Configurable.keys.map { |key| [key, instance_variable_get(:"@#{key}")] }]
      end
  end
end
