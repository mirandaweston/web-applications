# POST /sort-names Route Design Recipe

## 1. Design the Route Signature

Return a name message

Method: POST
Path: http://localhost:9292/sort-names
Query parameters:
  names (string)

## 2. Designing the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

When query param 'names' is `Joe,Alice,Zoe,Julia,Kieran`
```
Alice,Joe,Julia,Kieran,Zoe

```

## 3. Write Examples

```
# Request:

POST /sort-names?names=Joe,Alice,Zoe,Julia,Kieran

# Expected response:

Alice,Joe,Julia,Kieran,Zoe

Response for 200 OK

```

```
# Request:

POST /sort-names?names=Rosie,Tegan,Hannah,Chloe

# Expected response:

Chloe,Hannah,Rosie,Tegan

Response for 200 OK
```

## 4. Encode as Tests Examples

```ruby

# file: spec/integration/application_spec.rb

require "spec_helper"

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /" do
    it 'returns names in alphabetical order: Alice,Joe,Julia,Kieran,Zoe' do
      response = post('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq "Alice,Joe,Julia,Kieran,Zoe"
    end

    it 'returns names in alphabetical order: Rosie,Tegan,Hannah,Chloe' do
      response = post('/sort-names?names=Rosie,Tegan,Hannah,Chloe')

      expect(response.status).to eq(200)
      expect(response.body).to eq "Chloe,Hannah,Rosie,Tegan"
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

<!-- END GENERATED SECTION DO NOT EDIT -->