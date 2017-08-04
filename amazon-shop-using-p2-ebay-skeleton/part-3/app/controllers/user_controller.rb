# Sign in
get '/users/new' do
  erb :'users/new'
end

# Create user
post '/users' do
  @user = User.new(params[:user])
  if @user.save # why doesn't valid? work?
    session[:user_id] = @user.id
    redirect '/'
  else 
    @errors = @user.errors.full_messages
    erb :'users/new'
 	end
end

# READ
# users go to home page
get '/users/:id' do
	@user = User.find(params[:id]) #find only gets the id
  @auctions = Auction.where("seller_id = ?", params[:id])
	erb :"users/profile"
end
