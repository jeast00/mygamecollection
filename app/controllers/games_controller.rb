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

  get '/games/:id' do
    
  end

end
