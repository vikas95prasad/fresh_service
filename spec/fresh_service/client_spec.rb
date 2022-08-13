# frozen_string_literal: true

RSpec.describe FreshService::Client do

  before do
    FreshService.reset!
  end

  after do
    FreshService.reset!
  end

  it "creates a new client instance with no options" do
    client = FreshService::Client.new
    expect(client.content_type).to eq "application/json"
    expect(client.api_endpoint).to eq "https://#{client.organisation}.freshservice.com/api/v2"
    expect(client.user_agent).to eq "freshservice-api-client-#{FreshService::VERSION}"
  end

  it "creates a new client instance with the given options" do
    client = FreshService::Client.new(
      api_key: "api key"
    )

    expect(client.api_key).to eq "api key"
  end

  it "sets defaults" do
    FreshService::Configurable.keys.each do |key|
      expect(FreshService.instance_variable_get(:"@#{key}")).to eq(FreshService::Default.send(key))
    end
  end

  describe ".client" do
    it "creates an FreshService::Client" do
      expect(FreshService.client).to be_kind_of FreshService::Client
    end
    it "caches the client when the same options are passed" do
      expect(FreshService.client).to eq(FreshService.client)
    end
    it "returns a fresh client when options are not the same" do
      client = FreshService.client
      FreshService.api_key = "87614b09dd141c22800f96f11737ade5226d7ba8"
      client_two = FreshService.client
      client_three = FreshService.client
      expect(client).not_to eq(client_two)
      expect(client_three).to eq(client_two)
    end
  end

  describe ".configure" do
    FreshService::Configurable.keys.each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        FreshService.configure do |config|
          config.send("#{key}=", key)
        end
        expect(FreshService.instance_variable_get(:"@#{key}")).to eq(key)
      end
    end
  end

  it "should raise error if the API fails" do
    client = FreshService::Client.new
    stub_request(:post, "https://#{client.organisation}.freshservice.com/api/v2/tickets")
      .with(body: {}.to_json)
      .to_return(
        body: {
          code: "access_denied"
        }.to_json
      )

    expect { client.create_ticket({}) }.to raise_error(FreshService::Error::AuthenticationFailed)
  end
end
