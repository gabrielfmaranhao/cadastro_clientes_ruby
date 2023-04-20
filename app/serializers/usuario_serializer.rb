class UsuarioSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :cpf, :created_at, :updated_at
  has_many :clientes
end
