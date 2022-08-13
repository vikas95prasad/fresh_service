# frozen_string_literal: true

require "faraday"

RSpec.describe FreshService::Client::V2::Group::View do
  before do
    FreshService.reset!
    @client = FreshService::Client.new
  end

  describe "#view_group" do
    it "returns group details" do
      stub_request(:get, "https://#{@client.organisation}.freshservice.com/api/v2/groups/1")
        .with(body: {}.to_json)
        .to_return(
          status: 200,
            body: {
              name: "Group Name",
              description: "Group Description",
            }.to_json
        )

      group_res = @client.view_group(1)
      expect(group_res["name"]).to eq "Group Name"
      expect(group_res["description"]).to eq "Group Description"
    end
  end
end
