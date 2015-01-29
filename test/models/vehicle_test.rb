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

  test "stock should be present" do
    @vehicle.stock = nil
    assert_not @vehicle.valid?
  end

  test "profit should be substractions of bid and payout" do
  	assert_equal @vehicle.profit, @vehicle.bid - @vehicle.payout
  end

  # test "stock should be unique" do   #siwka something else to add - not duplicate vehicles
  #   duplicate_vehicle = @vehicle.dup
  #   duplicate_vehicle.stock = 55124
  #   @vehicle.save
  #   assert_not duplicate_vehicle.valid?
  # end 
end
