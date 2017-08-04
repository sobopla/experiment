class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
  		t.string :title, null: false
  		t.string :description
  		t.float :price, null: false
  		t.datetime :start_time, null: false
  		t.datetime :end_time, null: false
  		t.references :seller, index: true

  		t.timestamps
  	end
	end
end
