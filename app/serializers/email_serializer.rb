class EmailSerializer < ActiveModel::Serializer
  attributes :id, :mail
  has_one :cliente
end
