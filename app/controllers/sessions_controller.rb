class SessionsController < ApplicationController

  get '/signup' do
    erb :'/sessions/signup'
  end

  get '/sessions/signup' do
    redirect '/signup'
  end

  #post sign up account welcome page for user
  post '/signup' do
    @user = User.create(params)
    session[:user_id] = @user.id
    erb :'/users/welcome_user'
  end

  #get request for login page
  get '/sessions/login' do
    erb :'sessions/login'
  end

  #post login welcome back user and have user click to go to their account
  post '/sessions' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      erb :'/users/welcome_back_user'
    else
      erb :'/sessions/login_error'
    end
  end

end
