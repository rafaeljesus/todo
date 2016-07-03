require 'spec_helper'
require './app/models/todo'

describe 'V1::Controller::Todo' do
  _id = nil
  data = { title: 'Master praxis APIs', done: false }

  before do
   model =  Models::Todo.create data
   _id = model._id.to_s
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

  context '.update' do
    it 'update a todo item' do
      put "/api/todos/#{_id}?api_version=1", data.merge(done: true), provides: 'json'
      body = JSON.parse last_response.body
      expect(body['done']).to eq true
    end
  end

  context '.delete' do
    it 'delete a todo item' do
      delete "/api/todos/#{_id}?api_version=1"
      body = JSON.parse last_response.body
      expect(body['deleted']).to eq true
    end
  end
end
