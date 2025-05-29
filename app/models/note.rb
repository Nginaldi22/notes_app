class Note < ApplicationRecord
   belongs_to :homepage
   has_many :flashcards, dependent: :destroy
end
