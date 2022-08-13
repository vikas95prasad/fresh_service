# frozen_string_literal: true

require "faraday"

RSpec.describe FreshService::Client::V2::Ticket::Create do
  before do
    FreshService.reset!
    @client = FreshService::Client.new
  end

  describe "#create_ticket" do
    it "returns created ticket details" do
      body = {
        description: "Details about the issue",
        subject: "Support Needed",
        email: "tom@outerspace.com",
        priority: 1,
        status: 2
      }
      stub_request(:post, "https://#{@client.organisation}.freshservice.com/api/v2/tickets")
        .with(body: body.to_json)
        .to_return(
          status: 200,
          body: body.to_json
        )

      create_ticket_res = @client.create_ticket(body)
      expect(create_ticket_res["description"]).to eq "Details about the issue"
      expect(create_ticket_res["subject"]).to eq "Support Needed"
      expect(create_ticket_res["email"]).to eq "tom@outerspace.com"
      expect(create_ticket_res["priority"]).to eq 1
      expect(create_ticket_res["status"]).to eq 2
    end
  end
end
