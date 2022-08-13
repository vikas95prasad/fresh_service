# frozen_string_literal: true

require "faraday"

RSpec.describe FreshService::Client::V2::ServiceRequest::Create do
  before do
    FreshService.reset!
    @client = FreshService::Client.new
  end

  describe "#create_service_request" do
    it "returns created service request details" do
      body = {
        email: "tom@outerspace.com",
        custom_fields: {
          title: "title",
          description: "description"
        }
      }
      stub_request(:post, "https://#{@client.organisation}.freshservice.com/api/v2/service_catalog/items/1/place_request")
        .with(body: body.to_json)
        .to_return(
          status: 200,
          body: body.to_json
        )

      create_sr_res = @client.create_service_request(1, body)
      expect(create_sr_res["email"]).to eq "tom@outerspace.com"
      expect(create_sr_res["custom_fields"]["title"]).to eq "title"
      expect(create_sr_res["custom_fields"]["description"]).to eq "description"
    end
  end
end
