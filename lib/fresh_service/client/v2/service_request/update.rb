# frozen_string_literal: true

module FreshService
  class Client
    module V2
      module ServiceRequest
        module Update
          # Update a ServiceRequest
          #
          # @param ServiceRequest update refer create service request
          #
          # @return Faraday Response
          # @see https://api.freshservice.com/#update_req_items_of_sr
          def update_service_request(ticket_id, item_id, options = {})
            put "/tickets/#{ticket_id}/requested_items/#{item_id}", options
          end
        end
      end
    end
  end
end
