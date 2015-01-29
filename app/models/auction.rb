class Auction < ActiveRecord::Base
	has_many :vehicles, dependent: :destroy 

	validates :name,  presence: true,
                    length: { maximum: 50 },
                    uniqueness: { case_sensitive: false }
  validates :city, presence: true,
                    length: { maximum: 100 }

	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	  	auction = find_by_name(row['auction name']) || new
	    auction.attributes = { name: row['auction name'],
	                    							street: row['street address'],
	                    							city: row['city'],
	                    							state: row['state'],
	                    							zip: row['zip']}
	    auction.save!
	    auction.vehicles.create!( year: row['vehicle year'],
	    															make: row['vehicle make'],
	    														  model: row['vehicle model'],
																    stock: row['vehicle stock number'],
																    bid: row['winning bid'],
																    payout: row['seller payout'],
																    description: row['description'])
	  end
	end                    
end