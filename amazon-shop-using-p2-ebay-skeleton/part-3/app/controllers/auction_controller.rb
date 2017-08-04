

# # Index
get '/' do
  # Look in app/views/index.erb
  redirect "/auctions"
end

# Index
get '/auctions' do
  'This is the auctions index'
  # @auctions = Auction.all
  @auctions = Auction.where("start_time <= ? AND end_time >= ?", Time.now, Time.now)
   #@auctions.map{|auction| auction.name }
  erb :'auctions/index'
end

# new
get '/auctions/new' do
  "This is the auctions new action"
  erb :"auctions/new"
end

# create
post '/auctions' do
  params[:auction][:seller_id] = session[:user_id]
  # better to use new and 
  @auction = Auction.new(params[:auction]) # same as new
  if @auction.save
    redirect '/auctions'
  else
    # @errors = @auction.errors.full_messages
    flash[:error] = @auction.errors.full_messages.join("<br>")
    redirect '/auctions/new'
  end
  # The auctions create action"
end

# show
get '/auctions/:id' do
  # This is the auctions show action
  @auction = Auction.find(params[:id])
  erb :'auctions/show'
end

# edit
get '/auctions/:id/edit' do
  "This is the auctions edit action"
  @auction = Auction.find(params[:id])
  erb :'auctions/edit'
end

#update with both patch and put
patch '/auctions/:id' do
  "This is the auctions update action"
  @auction = Auction.find(params[:id])
  # @auction.update(params[:auction])
  # redirect "/users/#{session[:user_id]}"
  # above does not check for validations
  # below checks validations
  if @auction.update(params[:auction])
    redirect "/users/#{session[:user_id]}"
  else 
    flash[:error] = @auction.errors.full_messages.join("<br>")
    redirect "/auctions/#{params[:id]}/edit"
  end
end

#delete
delete '/auctions/:id' do
  "This is the auctions delete action"
  Auction.delete(params[:id])
  redirect "/users/#{session[:user_id]}"
end