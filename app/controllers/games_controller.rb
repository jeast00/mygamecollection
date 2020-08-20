class GamesController < ApplicationController

  get '/games/show_collection' do
    @games = Game.all
    erb :'/games/show_collection'
  end

  get '/games/new_game' do
    erb :'/games/new_game'
  end

  post '/games/show_collection' do
    @game = current_user.games.create(params)
    redirect '/games/show_collection'
  end

end
