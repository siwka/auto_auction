require 'test_helper'

class AuctionTest < ActiveSupport::TestCase

  def setup
    @auction = Auction.new(name: "Example auction", city: "Chicago")
  end

  test "should be valid" do
    assert @auction.valid?
  end

	test "name should be present" do
		@auction.name = ''
		assert_not @auction.valid?
	end

  test "city should be present" do
    @auction.city = "     "
    assert_not @auction.valid?
  end

  test "city should not be too long" do
    @auction.city = "a" * 100 + "Chicago"
    assert_not @auction.valid?
  end

  test "name should be unique" do
    duplicate_auction = @auction.dup
    duplicate_auction.name = @auction.name.upcase
    @auction.save
    assert_not duplicate_auction.valid?
  end

  test "auction profit shoud be equal to sum of all action vehicle profits" do
    @auction = auctions(:auction_one)
    @veh1 = vehicles(:one)
    @veh2 = vehicles(:two)
    @veh3 = vehicles(:four)
    suma = @veh1.profit + @veh2.profit + @veh3.profit
    assert_equal @auction.auction_profit, suma
  end

  test "auction average shoud be equal the auction made per vehicle" do
    @auction = auctions(:auction_one)
    @veh1 = vehicles(:one)
    @veh2 = vehicles(:two)
    @veh3 = vehicles(:four)
    aver = ((@veh1.profit + @veh2.profit + @veh3.profit)/3).round(2)
    assert_equal @auction.average_profit, aver
  end  
end
