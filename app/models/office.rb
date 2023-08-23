class Office < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings
  has_one_attached :photo
  validates :name, :address, :description, :price, presence: true
end
