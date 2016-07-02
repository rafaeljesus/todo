module Models
  class Todo
    include Mongoid::Document

    field :status, type: String
  end
end
