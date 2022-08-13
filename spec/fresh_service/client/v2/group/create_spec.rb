# frozen_string_literal: true

require "faraday"

RSpec.describe FreshService::Client::V2::Group::Create do
  before do
    FreshService.reset!
    @client = FreshService::Client.new
  end

  describe "#create_group" do
    it "returns created group details" do
      body = {
        name: "Group Name",
        description: "Group Description",
      }
      stub_request(:post, "https://#{@client.organisation}.freshservice.com/api/v2/groups")
        .with(body: body.to_json)
        .to_return(
          status: 200,
          body: body.to_json
        )

      create_group_res = @client.create_group(body)
      expect(create_group_res["name"]).to eq "Group Name"
      expect(create_group_res["description"]).to eq "Group Description"
    end
  end
end
