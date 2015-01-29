class Auction < ActiveRecord::Base
	has_many :vehicles
	validates :name,  presence: true,
                    length: { maximum: 50 }
  validates :city, presence: true,
                    length: { maximum: 100 }

	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	    Auction.create!(name: row['auction name'],
	                    street: row['street address'],
	                    city: row['city'],
	                    state: row['state'],
	                    zip: row['zip'])
	    # auction.vehicle.create!
	  end
	end                    
end