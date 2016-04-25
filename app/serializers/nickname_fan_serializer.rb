class NicknameFanSerializer < ActiveModel::Serializer
  attributes :id, :name, :plural, :status
end
