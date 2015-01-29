class Vehicle < ActiveRecord::Base
  belongs_to :auction
  validates :auction_id, :make, :model, presence: true #year siwka
  validates :description, length: { maximum: 500 }
end
