get "/posts" do
  @posts = Post.order("created_at DESC")
  erb :'posts/index'
end

post "/posts" do
  @post = Post.new(params[:post])
  if @post.save
    if request.xhr?
      erb :"posts/_post", locals: { post: @post}, layout: false
    else
      redirect "posts/#{@post.id}"
    end
  else
    erb :"posts/new"
  end
end

get "/posts/new" do
  @post = Post.new
  # if request.xhr?
  erb :'posts/new'
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  if request.xhr?
    erb :"/posts/_post", { post: @post}, layout: false
  else
  erb :'posts/show'
  end
end

put "/posts/:id/like" do
  @post = Post.find(params[:id])
  @post.increment!(:likes_count)
  if request.xhr?
    return { post: post, likes_count: post.likes_count }.to_json # get the post .points in the js and call here
  else
  redirect "/posts/#{@post.id}"
  end
end
