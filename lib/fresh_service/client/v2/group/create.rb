# frozen_string_literal: true

module FreshService
  class Client
    module V2
      module Group
        module Create
          # Create a group
          #
          # @param = [name, description, unassigned_for, agent_ids, members, approval_required]
          #
          # @return Faraday Response
          # @see https://api.freshservice.com/#create_a_group
          def create_group(options = {})
            post "/groups", options
          end
        end
      end
    end
  end
end
