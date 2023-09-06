class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  validates :stars, presence: true
end
