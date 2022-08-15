# FreshService API Client
Ruby toolkit for the Fresh Service API V2.

## Table of Contents
1. [Installation](#installation)
2. [API Documentation](#api-documentation)
3. [Making requests](#making-requests)
   1. [Initialization](#initialization)
   2. [Ticket](#ticket)
   3. [Group](#group)
   4. [Service Request](#service-request)
4. [License](#license)


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'fresh_service_api_v2_client'
```

And then execute:
```ruby
bundle install
```

Or install it yourself as:
```ruby
gem install fresh_service_api_v2_client
```

Access the library in Ruby:
```ruby
require 'fresh_service_api_v2_client'
```

## API Documentation
https://api.freshservice.com/

## Making requests
### Initialization
```ruby
# client initialization

ENV["FRESH_SERVICE_API_KEY"] = ''
ENV["FRESH_SERVICE_ORG"] = ''

client = FreshService::Client.new
```
OR
```ruby
client = FreshService::Client.configure do |c|
            c.organisation = 'xyz'
            c.api_key = 'api_key'
         end
```

### Ticket
```ruby
# Create a ticket
# @see https://api.freshservice.com/#create_ticket
client.create_ticket(options = {})

# Update a ticket
# @see https://api.freshservice.com/#update_ticket_priority
client.update_ticket(ticket_id, options = {})

# View a ticket
# @see https://api.freshservice.com/#view_a_ticket
client.view_ticket(ticket_id, options = {})
```

### Group
```ruby
# Create a group
# @see https://api.freshservice.com/#create_a_group
client.create_group(options = {})

# View a group
# @see https://api.freshservice.com/#view_a_group
client.view_group(group_id, options = {})
```

### Service Request
```ruby
# Create a Service Request
# @see https://api.freshservice.com/#create_service_request
client.create_service_request(display_id, options = {})

# Update a Service Request
# @see https://api.freshservice.com/#update_req_items_of_sr
client.update_service_request(ticket_id, item_id, options = {})
```

## License

MIT
