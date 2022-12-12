# frozen_string_literal: true

RSpec.describe 'GET /books', type: :request do
  it 'returns a list of books' do
    get '/books'

    expected_body = [
      { 'title' => 'Test Driven Development' },
      { 'title' => 'Practical Object-Oriented Design in Ruby' }
    ]

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq 'application/json; charset=utf-8'
    expect(parsed_body).to eq expected_body
  end
end
