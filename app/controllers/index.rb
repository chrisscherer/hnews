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
  @post = Post.create(params)

end


get '/login' do
  erb :login
end

post '/login' do
  if @user = User.authenticate(params[:user_name], params[:password])
    session[:user_name] = @user.user_name
    redirect to '/'
  else
    body.append('<h2>Username or password is invalid</h2>')
  end
end

post '/users/create' do
  @user = User.create(params)
  if @user.valid?
    session[:user_name] = @user.user_name
    redirect '/'
  end
    redirect '/login'
end
