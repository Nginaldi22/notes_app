class Homepage < ApplicationRecord
  belongs_to :registration
  has_many :notes, dependent: :destroy
end
