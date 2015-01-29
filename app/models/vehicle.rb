class Vehicle < ActiveRecord::Base
  belongs_to :auction
  validates :auction_id, :make, :model, :year, presence: true
  validates :description, length: { maximum: 500 }
end
