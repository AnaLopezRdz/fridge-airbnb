class Office < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings
  validates :name, :address, :description, :price, presence: true
end
