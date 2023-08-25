class Office < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings
  has_many_attached :photos
  validates :name, :address, :description, :price, presence: true
end
