class UsersController < ApplicationController


  get '/edit_user' do
    @user = current_user
    erb :'/users/edit_user'
  end

  get '/users/edit_user' do
    redirect '/edit_user'
  end

  get '/user_account' do
    @user = current_user
    erb :'/users/user_account'
  end

  get '/users/user_account' do
    redirect '/user_account'
  end

  patch '/user_account' do
    @user = current_user
    @user.firstname = params[:firstname]
    @user.lastname = params[:lastname]
    @user.save
    redirect '/user_account'
  end

  get '/validate_logout' do
    erb :'validate_logout'
  end


  #get request to log out the user
  get '/logout' do
    session.clear
    redirect '/'
  end

  # get request for a delete account page - validate if user wants to delete account
  # Yes - goes back to main page; No - goes back to users account page
  get '/delete_account' do
    erb :'/users/delete_account'
  end

  get 'users/delete_account' do
    redirect '/delete_account'
  end

  delete '/validate_delete' do
    current_user.destroy
    redirect '/'
  end

end
