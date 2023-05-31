require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET /' do
    it 'returns 200 OK' do
      response = get ("/names?names=Julia, Mary, Karim")

      expect(response.status).to be(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end
  context "POST /" do
    it 'returns 200 OK' do
      names = "Joe,Alice,Zoe,Julia,Kieran"
      response = post("/sort-names?names=#{names}")
      result = "Alice,Joe,Julia,Kieran,Zoe"

      expect(response.status).to eq(200)
      expect(response.body).to eq (result)
    end
  end
end

