# frozen_string_literal: true

require "faraday"

RSpec.describe FreshService::Client::V2::Ticket::View do
  before do
    FreshService.reset!
    @client = FreshService::Client.new
  end

  describe "#view_ticket" do
    it "returns ticket details" do
      stub_request(:get, "https://#{@client.organisation}.freshservice.com/api/v2/tickets/1")
        .with(body: {}.to_json)
        .to_return(
          status: 200,
            body: {
              description: "Details about the issue",
              subject: "Support Needed",
              email: "tom@outerspace.com",
              priority: 1,
              status: 2
            }.to_json
        )

      ticket_res = @client.view_ticket(1)
      expect(ticket_res["description"]).to eq "Details about the issue"
      expect(ticket_res["subject"]).to eq "Support Needed"
      expect(ticket_res["email"]).to eq "tom@outerspace.com"
      expect(ticket_res["priority"]).to eq 1
      expect(ticket_res["status"]).to eq 2
    end
  end
end
