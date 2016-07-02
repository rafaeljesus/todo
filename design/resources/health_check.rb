module V1
  module ApiResources
    class HealthCheck
      include Praxis::ResourceDefinition

      description 'Resource to check if the application is running.'

      media_type V1::MediaTypes::HealthCheck
      version '1.0'

      prefix '/'

      action_defaults do
        response :ok
      end

      action :index do
        routing do
          get '/health_check'
        end
      end
    end
  end
end
