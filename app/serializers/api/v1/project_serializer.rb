module Api
  module V1
    class ProjectSerializer < ActiveModel::Serializer
      attributes :id, :name, :description, :created_at, :updated_at

      attribute :capitalize_name do
        object.name.capitalize
      end
    end
  end
end