class BlogPostsController < ApplicationController
    before_action :find_blog, only:[:show, :update, :destroy]
    def index
        @posts = BlogPost.all
        render json: @posts
    end

    def show
        render json: @post
    end

    def create
        @post = BlogPost.new(post_params)
        if @post.save
            render json: @post
        else
            render json: {errors: @post.errors.full_messages}
        end
    end

    def update
        if @post.update(post_params)
            render json: @post
        else
            render json: {errors: @post.errors.full_messages}
        end
    end

    def destroy
        @post.destroy

        render json: @post
    end

    private

    def find_blog
        @post = BlogPost.find(params[:id])
    end

    def post_params
        params.require(:blog_post).permit(:title, :author, :content, :likes)
    end

end
