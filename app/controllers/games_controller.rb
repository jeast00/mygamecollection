class GamesController < ApplicationController

  get '/games' do
    @games = Game.all
    erb :'/games/show_collection'
  end

  get '/games/new_game' do
    erb :'/games/new_game'
  end

  post '/games' do
    @game = current_user.games.create(params)
    redirect '/games'
  end

  get '/games/show_collection' do
    redirect '/games'
  end

  get '/games/:id/edit_game_details' do
    @game = Game.find(params[:id])
    erb :"/games/edit_game_details"
  end

  get '/games/:id' do
    @game = Game.find(params[:id])
    erb :'/games/show_game_details'
  end

  patch '/games/:id' do
    @game = Game.find(params[:id])
    @game.title = params[:title]
    @game.company = params[:company]
    @game.platform = params[:platform]
    @game.save
    redirect '/games'
  end



end
