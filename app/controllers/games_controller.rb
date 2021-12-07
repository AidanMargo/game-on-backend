class GamesController < ApplicationController

    #/games#index
    def index 
        games = Game.all
        render json: games
    end


    def show 
        game = Game.find(params[:id])
        render json: game
    end

    def create 
        game = Game.create(game_params)
        render json: game, status: :created
    end


    private

    def game_params
        params.permit(:name, :date, :sport, :location, :current_players, :max_players, :description, :host_id)
    end


end
