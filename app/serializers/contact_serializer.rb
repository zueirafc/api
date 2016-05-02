class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :message, :category, :status
end
