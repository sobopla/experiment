# Login 
# sessions new action
get '/sessions/login' do
	erb :'sessions/login'
end

# sessions create action
post '/sessions' do
	visitor = User.authenticate(params[:user][:email], params[:user][:password]) #find only works with an id and doesn't have any options, use find_by
		if visitor
			#create a session - access a session with a hash
			session[:user_id] = visitor.id
			@successful = ["Login succ"]
			redirect '/'
		else 
			status 422 # = sent info we can't process
			@errors = ["Login failed!"]
			erb :'sessions/login'
		end
end

# Logout
get '/sessions/logout' do
	session.delete(:user_id)
	redirect '/'
end