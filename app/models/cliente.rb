class Cliente < ApplicationRecord
  belongs_to :usuario
  validates :name, presence: true
  validates :cpf, presence:true, uniqueness: true, length: {is: 11}
end
