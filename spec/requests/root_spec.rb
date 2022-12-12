# frozen_string_literal: true

RSpec.describe 'Root' do
  it 'is successful', type: :request do
    get '/'

    # Find me in `config/routes.rb`
    expect(last_response).to be_successful
    expect(last_response.body).to eq('Hello from Hanami')
  end
end
