class Homepage < ApplicationRecord
  belongs_to :registration
  has_many :subjects, dependent: :destroy
end
