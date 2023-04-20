class Usuario < ApplicationRecord
  has_many :clientes
  include BCrypt
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :cpf, presence: true, uniqueness: true

  def authenticate(password_bank)
    @password ||= Password.new(password_bank)
  end
  def create_hash(password)
    @password ||= Password.create(password)
  end
end
