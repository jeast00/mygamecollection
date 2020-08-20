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

  get '/edit_user' do
    @user = current_user
    erb :'edit_user'
  end

  # get '/user_account/edit' do
  #   @user = current_user
  #   erb :'edit_user'
  # end

  patch '/user_account' do
    @user = current_user
    @user.firstname = params[:firstname]
    @user.lastname = params[:lastname]
    @user.save
    erb :"/user_account"
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

end
