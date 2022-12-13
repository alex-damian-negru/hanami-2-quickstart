# frozen_string_literal: true

RSpec.describe 'POST /books', type: %i[request database] do
  let(:request_headers) { { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json' } }

  context 'with valid params' do
    let(:params) do
      { book: { title: 'Practical Object-Oriented Design in Ruby', author: 'Sandi Metz' } }
    end

    it 'creates a book' do
      post '/books', params.to_json, request_headers

      expect(last_response).to be_created
    end
  end

  context 'with invalid params' do
    let(:params) { { book: { title: nil } } }

    it 'returns 422 unprocessable' do
      post '/books', params.to_json, request_headers

      expect(last_response).to be_unprocessable
    end
  end
end
