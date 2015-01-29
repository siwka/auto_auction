class Auction < ActiveRecord::Base
	validates :name,  presence: true,
                    length: { maximum: 50 }
  validates :city, presence: true,
                    length: { maximum: 100 }

	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	    Auction.create!(name: row[0],
	                    street: row[1],
	                    city: row[2],
	                    state: row[3],
	                    zip: row[4])
	    # auction.vehicle.create!
	  end
	end                    
end