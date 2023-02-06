require 'spec_helper'
require 'rack/test'
require_relative '../../app'


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