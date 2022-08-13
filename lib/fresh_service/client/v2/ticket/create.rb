# frozen_string_literal: true

module FreshService
  class Client
    module V2
      module Ticket
        module Create
          # Create a ticket
          #
          # @param = [name, requester_id, email, phone, subject, type, status, priority, description,
          #           responder_id, attachments, cc_emails, custom_fields, due_by, email_config_id,
          #           fr_due_by, group_id, source, tags, department_id, category, sub_category,
          #           item_category, associate_ci, assets, urgency, impact, problem]
          #
          # @return Faraday Response
          # @see https://api.freshservice.com/#create_ticket
          def create_ticket(options = {})
            post "/tickets", options
          end
        end
      end
    end
  end
end
