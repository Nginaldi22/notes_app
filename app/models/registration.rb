class Registration < ApplicationRecord
  before_save :downcase_email
  has_secure_password
  has_one :homepage, dependent: :destroy
  validates :password, confirmation: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
