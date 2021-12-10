class UsersController < ApplicationController
    before_action :authenticate_user
    skip_before_action :authenticate_user, only: [:create, :show, :games, :update]

    def create 
        user = User.create(user_params) 
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show 
        user = User.find(session[:user_id])
        if user
            render json: user
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    def update
        user = User.find(params[:id])
        if user.valid?
            user.update(user_params)
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end


    def games
        user = User.find(session[:user_id])
        games = user.games
        render json: games, include: :participants
    end

    def hosted_games
        user = User.find(session[:user_id])
        hosted_games = User.hosted_games
        render json: hosted_games, include: :participants
    end

    private

    def user_params
        params.permit(:id, :game, :name, :age, :email, :city, :profile_pic, :password_confirmation, :password, :user)
    end

    def authenticate_user
        return render json: { error: "Not authorized" }, status: :unauthorized unless session[:user_id] == params[:id]
    end

end
