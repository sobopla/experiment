post '/auctions/:id/bids/new' do
  auction = Auction.find(params[:id])
  if logged_in?
    
  # auction = Auction.where("auction_id = params[:auction_id]")
  # auction = Auction.find(params[:auction_id])

    if params[:bid_amount] > auction.price
      #create new bid  attached to the user and the auction
      
      # binding.pry
      # give auction a new price
      # auction.assign_attributes(price: params[:bid_amount])
      # make sure the auction saves
      redirect "/auctions/#{auction.id}"
    else
      # handle errors and show the auction
      @errors = ["Bid must be higher than current price"]

      erb :'auctions/show'
    end
  else
    # if not logged in redirect to login
    redirect '/sessions/login'
  end
end

