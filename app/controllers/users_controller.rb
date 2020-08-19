class UsersController < ApplicationController

  get '/signup' do
    erb :'signup'
  end

  #post sign up account welcome page for user
  post '/signup' do
    @user = User.create(params)
    session[:user_id] = @user.id
    erb :'welcome_user'
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
      erb :'welcome_back_user'
    else
      erb :'login_error'
    end
  end

  get '/user_account' do
    erb :'user_account'
  end

  #get request to log out the user
  get '/logout' do
    session.clear
    redirect :'/'
  end

  # get request for a delete account page - validate if user wants to delete account
  # Yes - goes back to main page; No - goes back to users account page
  get '/delete_account' do
    erb :'delete_account'
  end

  delete '/validate_delete' do
    current_user.destroy
    redirect :'/'
  end
  #add helper methods to check to see if current user and if logged in
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
