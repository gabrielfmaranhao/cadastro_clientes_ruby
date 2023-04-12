class UsuarioSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :created_at, :updated_at
  has_many :clientes
end
