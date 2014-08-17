class Task
  include Mongoid::Document
  field :name, type: String
  field :status, type: String

  belongs_to :project
end

