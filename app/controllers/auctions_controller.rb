class AuctionsController < ApplicationController
  def index
  	@auctions = Auction.all
  end

	def import
	  Auction.import(params[:file])
	  redirect_to root_url, notice: "Auctions imported."
	end
end
