get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do

end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:user_name], params[:password])
  if @user != nil
    session[:user_name] = @user.user_name
    redirect to '/'
  else
    body.append('<h2>Username or password is invalid</h2>')
  end
end

post '/create_user' do
  @user = User.create(params)
  session[:user_name] = @user.user_name
  redirect '/'
end

get '/signed_in?' do
  session[:user_name]
end
