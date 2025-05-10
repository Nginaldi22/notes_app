class Registration < ApplicationRecord
  has_secure_password
  has_one :homepage, dependent: :destroy
  validates :password, confirmation: true
  validates :name, presence: true
  # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
