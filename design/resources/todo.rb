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
        description 'Returns a collection os all available todos.'

        routing do
          get '/todos'
        end
      end

      action :create do
        description 'Create a todo item on database.'

        routing do
          post '/todos'
        end

        payload do
          attribute :title, String, required: true
          attribute :done, Boolean, required: true
        end
      end

      action :update do
        description 'Update a todo item on database.'

        routing do
          put '/todos/:id'
        end

        params do
          attribute :id, String, required: true
        end

        payload do
          attribute :title, String, required: true
          attribute :done, Boolean, required: true
        end
      end

      action :delete do
        description 'Delete a todo item on database.'

        routing do
          delete '/todos/:id'
        end

        params do
          attribute :id, String, required: true
        end
      end
    end
  end
end
