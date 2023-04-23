class Email < ApplicationRecord
  validates :mail, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "formato de email inválido" }
  belongs_to :cliente
end
