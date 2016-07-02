require 'spec_helper'

describe 'V1::Controller::HealthCheck' do
  context '.index' do
    it 'check if api is running' do
      get '/health_check?api_version=1'
      body = JSON.parse last_response.body
      expect(body['message']).to eq 'API running!'
    end
  end
end
