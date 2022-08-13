# frozen_string_literal: true

require "faraday"

RSpec.describe FreshService::Client::V2::Ticket::Update do
  before do
    FreshService.reset!
    @client = FreshService::Client.new
  end

  describe "#update_ticket" do
    it "returns updated ticket details" do
      body = {
        id: 1,
        description: "Updated description",
      }
      stub_request(:put, "https://#{@client.organisation}.freshservice.com/api/v2/tickets/1/requested_items/1")
        .with(body: body.to_json)
        .to_return(
          status: 200,
          body: body.to_json
        )

      update_ticket_res = @client.update_service_request(1, 1, body)
      expect(update_ticket_res['description']).to eq "Updated description"
    end
  end
end
