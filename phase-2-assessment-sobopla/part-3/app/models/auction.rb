class Auction < ActiveRecord::Base
  belongs_to :seller, { class_name: 'User', foreign_key: :user_id }
  has_many :bids,  { class_name: 'Bid', foreign_key: :auction_id }

  validates :title, :description, :price, :start_time, :end_time, { presence: true}

  #edge case for if user enters a start time after the end time 
end
