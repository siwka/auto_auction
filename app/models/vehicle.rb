class Vehicle < ActiveRecord::Base
  belongs_to :auction
  validates :auction_id, :make, :model, presence: true
  validates :description, length: { maximum: 500 }
  validates :stock, presence: true#, uniqueness: true #siwka to add - not duplicate vehicle, cannot be stock

  def profit
  	self.bid - self.payout
  end
end
