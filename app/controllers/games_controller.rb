class GamesController < ApplicationController

  get '/games' do
    @games = Game.all
    erb :'games/show_collection'
  end

  get '/games/new_game' do
    erb :'games/new_game'
  end

  post '/games/new_game' do
    game = current_user.games.build(params)
    game.save
    redirect '/games'
  end
end
