class Auction < ActiveRecord::Base
	validates :name,  presence: true,
                    length: { maximum: 50 }
  validates :city, presence: true,
                    length: { maximum: 100 }

	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	    Auction.create! row.to_hash
	  end
	end                    
end
