class PostsController < ApplicationController
    before_action :require_user_logged_in!
    before_action :set_post, only: [:show, :update, :edit, :destroy]
    def index
        @posts = Current.user.posts
    end

    def new
        @post = Post.new
    end

    def create
        @post = Current.user.posts.new(post_params)
        if @post.save
            redirect_to posts_path, notice: "Post was scheduled successfully"
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @post.update(post_params)
            redirect_to posts_path, notice: "Post was updated successfully"
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path, notice: "Post was unscheduled successfully"
    end
    
    private
    def post_params
        params.require(:post).permit(:twitter_account_id, :body, :publish_at)
        # params
    end

    def set_post
        @post = Current.user.posts.find(params[:id])
    end
end