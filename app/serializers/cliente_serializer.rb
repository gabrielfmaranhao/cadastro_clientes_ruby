class ClienteSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :usuario_at_cadastro,:created_at, :updated_at
  # has_one :usuario
  has_many :telefones
end
