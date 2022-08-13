# frozen_string_literal: true

module FreshService
  class Error < StandardError
    class AuthenticationFailed < self; end
  end
end
