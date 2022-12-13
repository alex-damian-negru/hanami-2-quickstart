# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'GET /books pagination', type: %i[request database] do
  let(:books) { app['persistence.rom'].relations[:books] }

  before do
    values = Array(0..9).map { |i| { title: "Book #{i}", author: "Author #{i}" } }
    books.multi_insert(values)
  end

  context 'with valid page and per_page params' do
    it 'returns the correct page of books' do
      expected_body = [
        { title: 'Book 0', author: 'Author 0' },
        { title: 'Book 1', author: 'Author 1' },
        { title: 'Book 2', author: 'Author 2' }
      ]

      get '/books?page=1&per_page=3'

      expect(last_response.status).to eq 200
      expect(parsed_body).to eq(expected_body)
    end
  end
end
