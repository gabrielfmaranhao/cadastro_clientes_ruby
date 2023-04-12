class ClienteSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf
  has_one :usuario
end
