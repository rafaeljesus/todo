require 'spec_helper'

describe 'V1::Controller::Todo' do
  before do
    data = { title: 'Master praxis APIs', done: false }
    Models::Todo.create data
  end

  after do
    Models::Todo.delete_all
  end

  context '.index' do
    it 'returns all todos' do
      get '/api/todos?api_version=1'
      body = JSON.parse last_response.body
      expect(body.length).to eq 1
    end
  end
end
