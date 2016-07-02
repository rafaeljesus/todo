module V1
  class Todo
    include Praxis::Controller

    implements V1::ApiResources::Todo

    def index(**params)
      response.headers['Content-Type'] = 'application/json'
      response.body = Models::Todo.all
      response
    end
  end
end
