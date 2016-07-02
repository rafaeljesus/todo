module V1
  module ApiResources
    class Todo
      include Praxis::ResourceDefinition

      description 'Resources of the Todo application.'

      media_type V1::MediaTypes::Base
      version '1'

      prefix '/api'

      action_defaults do
        response :ok
      end

      action :index do
        routing do
          get '/todos'
        end
      end
    end
  end
end
