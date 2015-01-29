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
end
