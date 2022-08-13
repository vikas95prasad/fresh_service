# frozen_string_literal: true

require "json"
require "addressable/uri"
require "faraday"

# Network layer for API clients.
module FreshService
  module Connection
    # 408 -> Request Timeout
    # 502 -> Bad Gateway
    # 503 -> Service Unavailable
    # 504 -> Gateway Timeout
    RETRY_HTTP_CODES = [408, 502, 503, 504].freeze

    # Make a HTTP GET request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @return response body object
    def get(url, body = {})
      request :get, url, body
    end

    # Make a HTTP POST request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param body [Hash] Body for request
    # @return response body object
    def post(url, body = {})
      request :post, url, body
    end

    # Make a HTTP PUT request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param body [Hash] Body for request
    # @return response body object
    def put(url, body = {})
      request :put, url, body
    end

    private

      def request(method, path, body = {})
        agent = setup_connection(path)
        response = agent.send(method) { |req| req.body = body.to_json }
        response_body = JSON.parse(response.body)

        if response_body["code"] == "access_denied"
          raise Error::AuthenticationFailed
        else
          response_body
        end
      end

      def setup_connection(path)
        url = Addressable::URI.parse(api_endpoint + path).normalize.to_s
        @agent = Faraday.new(url) do |req|
          req.request :basic_auth, api_key, ""
          req.headers["User-Agent"] = user_agent
          req.headers["Content-Type"] = content_type
          req.adapter Faraday.default_adapter
          req.request :retry, retry_options
        end
      end

      def retry_options
        {
          max: 3, interval: 0.05,
          interval_randomness: 0.5, backoff_factor: 2,
          retry_statuses: RETRY_HTTP_CODES
        }
      end
  end
end
