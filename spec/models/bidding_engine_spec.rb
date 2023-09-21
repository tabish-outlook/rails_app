require 'rails_helper'

RSpec.describe BiddingEngine do
  describe ".bid!" do
    let(:seller) { User.create(email: 'seller@email.com', password: '12345') }
    let(:bidder) { User.create(email: 'bidder@email.com', password: '12345') }
    let(:auction) { Auction.create(title: 'Test Auction', description: 'Short description', start_date: DateTime.now, end_date: DateTime.now + 1.week, user_id: seller.id) }

    amount  = 100
    less_amount = 90

    it "create a new bid on an auction if bid is bigger than last bid on auction" do
      described_class.bid!(auction, amount, bidder)
      expect(auction.errors).to be_empty

      described_class.bid!(auction, less_amount, bidder)
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
    end

    it "cannot create a bid if its an equal amount as the last bid" do
      described_class.bid!(auction, amount, bidder)
      expect(auction.errors).to be_empty

      described_class.bid!(auction, amount, bidder)
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
    end
  end
end
