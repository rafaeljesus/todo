require 'spec_helper'
require './app/models/todo'

describe 'V1::Controller::Todo' do
  data = { title: 'Master praxis APIs', done: false }

  before do
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

  context '.create' do
    it 'create a todo item' do
      post '/api/todos?api_version=1', data, provides: 'json'
      body = JSON.parse last_response.body
      expect(body['done']).to eq false
    end
  end
end
