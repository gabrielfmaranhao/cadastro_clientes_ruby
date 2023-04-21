class Telefone < ApplicationRecord
  validates :number, presence:true, uniqueness: true, length:{is:11}
  belongs_to :cliente
end
