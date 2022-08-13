# frozen_string_literal: true

module FreshService
  class Client
    module V2
      module ServiceRequest
        module Create
          # Create a ServiceRequest
          #
          # @param for service request
          # | Attribute     | Type   | Description                                                              |
          # | display_id    | number | Service Item ID inside service catalog                                   |
          # | quantity      | number | Quantity needed by the requested                                         |
          # | requested_for | email  | Email id of the requester on whose behalf the service request is created |
          # | email         | email  | Email id of the requester                                                |
          # | child_items   | -      | Provide the display id as service_item_id for each child item.           |
          # | custom_fields | -      | Values of custom fields present in the service item form                 |
          #
          # @return Faraday Response
          # @see https://api.freshservice.com/#create_service_request
          def create_service_request(display_id, options = {})
            post "/service_catalog/items/#{display_id}/place_request", options
          end
        end
      end
    end
  end
end
