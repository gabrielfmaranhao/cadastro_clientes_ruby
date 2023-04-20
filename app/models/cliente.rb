class Cliente < ApplicationRecord
  belongs_to :usuario
  validates :name, presence: true
  validates :cpf, presence:true, uniqueness: true, length: {is: 11}
  validate :cpf_check


  def cpf_check
    if Usuario.where(cpf: cpf).exists?
      errors.add(:cpf, "CPF já existe como usuário")
    end
  end
end
