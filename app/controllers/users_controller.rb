class UsersController < ApplicationController

  get '/signup' do
    erb :signup
  end

  #post sign up account welcome page for user


  #get request for login page
  get '/sessions/login' do
    erb :'sessions/login'
  end

  #post login welcome back user and have user click to go to their account

end
