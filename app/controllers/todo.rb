module V1
  class Todo
    include Praxis::Controller

    implements V1::ApiResources::Todo

    def index(**params)
      respond_with Models::Todo.all
    end

    def create(**params)
      payload = request.payload.contents
      respond_with Models::Todo.create payload
    end

    private
    def respond_with(body)
      response.headers['Content-Type'] = 'application/json'
      response.body = body.to_json
      response
    end
  end
end
