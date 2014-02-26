require 'pry'
require 'pry-nav'

get '/' do
  # Look in app/views/index.erb

  erb :index
end

post '/' do

end

get '/posts/new' do
  erb :posts_new
end

post '/posts/new' do
  params[:author_id] = session[:user_id]
  @post = Post.create(params)
  if @post.valid?
    redirect to '/'
  else
    body.append('<h2>Put both things plz</h2>')
  end
end

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  erb :view_post
end

post '/posts/:post_id' do
  params[:user_id] = session[:user_id]
  Comment.create(user_id: params[:user_id], text: params[:text])
  erb :view_post
end



get '/login' do
  erb :login
end

post '/login' do
  if @user = User.authenticate(params[:user_name], params[:password])
    session[:user_name] = @user.user_name
    session[:user_id] = @user.id
    redirect to '/'
  else
    body.append('<h2>Username or password is invalid</h2>')
  end
end

post '/users/create' do
  @user = User.create(params)
  if @user.valid?
    session[:user_name] = @user.user_name
    session[:user_id] = @user.id
    redirect '/'
  end
    redirect '/login'
end
