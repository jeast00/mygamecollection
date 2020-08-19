class GamesController < ApplicationController

  get '/add_game' do
    erb :add_game
  end
end
