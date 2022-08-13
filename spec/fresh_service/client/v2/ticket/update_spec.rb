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
        ticket_id: 1,
        description: "Updated description"
      }
      stub_request(:put, "https://#{@client.organisation}.freshservice.com/api/v2/tickets/#{body[:ticket_id]}")
        .with(body: body.to_json)
        .to_return(
          status: 200,
          body: body.to_json
        )

      update_ticket_res = @client.update_ticket(body[:ticket_id], body)
      expect(update_ticket_res["description"]).to eq "Updated description"
    end
  end
end
