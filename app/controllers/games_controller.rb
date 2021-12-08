class GamesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :game_not_found
    before_action :check_user, only: [:create, :show, :index]
    before_action :authenticate_user, only: [:delete]

    #/games#index
    def index 
        games = Game.all
        render json: games
    end

    def show 
        game = Game.find(params[:id])
        render json: game, include: :participants
    end

    def create 
        game = Game.create(game_params)
        if game.valid?
            Participant.create(user_id: session[:user_id], game_id: game.id)
            render json: game, status: :created
        else 
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy 
        game = Game.find(params[:id])
        game.destroy
        head :no_content
    end


    private

    # def make_participant
    #     Participant.create(user_id: session[:user_id], game_id: game.id)
    # end

    def game_params
        params.permit(:name, :date, :sport, :location, :current_players, :max_players, :description, :host_id)
    end

    def game_not_found
        render json: { error: "Game not found" }, status: :not_found
    end

    def check_user
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end

    def authenticate_user
        return render json: { error: "Not authorized" }, status: :unauthorized unless session[:user_id] == params[:user_id]
    end
end
