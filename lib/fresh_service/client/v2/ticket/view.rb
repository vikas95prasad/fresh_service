# frozen_string_literal: true

module FreshService
  class Client
    module V2
      module Ticket
        module View
          # View a ticket
          #
          # @param = [ticket_id]
          #
          # @return Faraday Response
          # @see https://api.freshservice.com/#view_a_ticket
          def view_ticket(ticket_id, options = {})
            get "/tickets/#{ticket_id}", options
          end
        end
      end
    end
  end
end
