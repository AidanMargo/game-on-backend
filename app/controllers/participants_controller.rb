class ParticipantsController < ApplicationController

    def create
        participant = Participant.create(participant_params)
        if participant.valid?
            rener json: participant
            game = Game.find(params[:game_id])
            game.update(current_players: game.participants.count)
        else
            render json: {errors: user.errors.full_messeges }, status: :unprocessable_entity
        end
    end

    def destroy
        participant = Participant.find(params[:id])
        game = game.find(params[:game_id])
        participant.destroy
        game.update(current_players: game.participants.count)
        head :no content
    end


    private
    
    def participant_params
        params.permit(:user_id, :game_id)
    end
end
