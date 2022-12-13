# auto_register: false
# frozen_string_literal: true

require 'hanami/action'

module Bookshelf
  class Action < Hanami::Action
    config.handle_exception ROM::TupleCountMismatchError => :handle_not_found

    before :validate_params!

    private

    def handle_not_found(_request, response, _error)
      response.status = 404
      response.format = :json
      response.body = { error: 'not_found' }.to_json
    end

    def validate_params!(request, _response)
      halt 422, { errors: request.params.errors }.to_json unless request.params.valid?
    end
  end
end
