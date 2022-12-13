# frozen_string_literal: true

RSpec.describe 'GET /books', type: :request do
  let(:books) { app['persistence.rom'].relations[:books] }

  before do
    books.insert(title: 'Practical Object-Oriented Design in Ruby', author: 'Sandi Metz')
    books.insert(title: 'Test Driven Development', author: 'Kent Beck')
  end

  it 'returns a list of books' do
    get '/books'

    expected_body = [
      { title: 'Practical Object-Oriented Design in Ruby', author: 'Sandi Metz' },
      { title: 'Test Driven Development', author: 'Kent Beck' }
    ]

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq 'application/json; charset=utf-8'
    expect(parsed_body).to eq expected_body
  end
end
