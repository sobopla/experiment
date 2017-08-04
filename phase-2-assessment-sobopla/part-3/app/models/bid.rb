class Bid < ActiveRecord::Base
  belongs_to :bidder, { class_name: 'User', foreign_key: :user_id }
  belongs_to :auction, { class_name: 'Auction', foreign_key: :auction_id }

  validates :bid_amount, { presence: true}
end
