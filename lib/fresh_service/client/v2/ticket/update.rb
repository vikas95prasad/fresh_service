# frozen_string_literal: true

module FreshService
  class Client
    module V2
      module Ticket
        module Update
          # Update a ticket
          #
          # @param Refer create ticket
          #
          # @return Faraday Response
          # @see https://api.freshservice.com/#update_ticket_priority
          def update_ticket(ticket_id, options = {})
            put "/tickets/#{ticket_id}", options
          end
        end
      end
    end
  end
end
