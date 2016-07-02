module V1
  module MediaTypes
    class Base < Praxis::MediaType
      identifier 'application/json'

      attributes do
        attribute :message, String
      end

      view :default do
        attribute :message
      end
    end
  end
end
