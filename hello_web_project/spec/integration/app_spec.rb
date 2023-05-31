require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET /hello' do
    it 'returns htmal index' do
      response = get("/hello")
      expect(response.body).to include('<h1>Hello!</h1>')
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

