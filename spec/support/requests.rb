# frozen_string_literal: true

require 'rack/test'

RSpec.shared_context 'with the shared context' do
  let(:app) { Hanami.app }

  def parsed_body = JSON.parse(last_response.body, symbolize_names: true)
end

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include_context 'with the shared context', type: :request
end
