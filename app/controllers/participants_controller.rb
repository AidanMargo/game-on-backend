class ParticipantsController < ApplicationController
    before_action :check_user, only: [:create]
    before_action :authenticate_user, only: [:destroy]

    def create
        participant = Participant.create(participant_params)
        if participant.valid?
            render json: participant
            game = Game.find(params[:game_id])
            game.update(current_players: game.participants.count)
        else
            render json: {errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        participant = Participant.find(params[:id])
        game = Game.find(participant.game_id)
        participant.destroy
        game.update(current_players: game.participants.count)
        head :no_content
    end


    private
    
    def participant_params
        params.permit(:user_id, :game_id)
    end

    def check_user
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end

    def authenticate_user
        return render json: { error: "Not authorized" }, status: :unauthorized unless session[:user_id] == Participant.find(params[:id]).user_id

    end
end
