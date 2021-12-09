class PostsController < ApplicationController :comments, :user
    #before_action :check_user

    def index
        posts = Posts.all
        render json: posts, include: ['comments', 'comments.user']


    private

    def check_user
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end

end
