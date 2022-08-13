# frozen_string_literal: true

module FreshService
  class Client
    module V2
      module Group
        module View
          # View a Group
          #
          # @param = [group_id]
          #
          # @return Faraday Response
          # @see https://api.freshservice.com/#view_a_group
          def view_group(group_id, options = {})
            get "/groups/#{group_id}", options
          end
        end
      end
    end
  end
end
