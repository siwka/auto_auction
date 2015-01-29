require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  def setup
  	@auction = auctions(:auction_one)
    @vehicle = @auction.vehicles.build(make: 'Ford', model: 'Focus', year: 2012,
    											 stock: 55124, bid: 11000, payout: 9500, description: '')
  end

  test "should be valid" do
    assert @vehicle.valid?
  end

	test "make should be present" do
		@vehicle.make = ''
		assert_not @vehicle.valid?
	end

  test "model should be present" do
    @vehicle.model = "     "
    assert_not @vehicle.valid?
  end

  test "description should not be too long" do
    @vehicle.description = "a" * 500 + "description"
    assert_not @vehicle.valid?
  end

  test "auction id should be present" do
    @vehicle.auction_id = nil
    assert_not @vehicle.valid?
  end  
end
