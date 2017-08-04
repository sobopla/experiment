class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
  		t.float :bid_amount, null: false
  		t.references :bidder, index: true
  		t.references :auction, index: true

  		t.timestamps

  	end
  end
end
