class GamesController < ApplicationController

    #/games#index
    def index 
        games = Game.all
        render json: games
    end


end
