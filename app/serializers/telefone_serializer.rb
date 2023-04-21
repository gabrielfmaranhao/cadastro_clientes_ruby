class TelefoneSerializer < ActiveModel::Serializer
  attributes :id, :number
  has_one :cliente
end
