module V1
  class HealthCheck
    include Praxis::Controller

    implements V1::ApiResources::HealthCheck

    def index(**params)
      response.headers['Content-Type'] = 'application/json'
      response.body = { message: 'API running!' }
      response
    end
  end
end
