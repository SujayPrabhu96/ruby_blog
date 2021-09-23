class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @categories = Category.all
    end

    def create
        @post = Post.new(permit_params)
        if @post.save
            redirect_to posts_path, :notice => "Post saved Successfully!"
        else
            render "new"
        end
    end

    def edit
        @post = Post.find(params[:id])
        @categories = Category.all
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(permit_params)
            redirect_to post_path, :notice => "Post updated Successfully!"
        else
            render "edit"
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path, :notice => "Post deleted Successfully!"
    end

    def permit_params
        params.require(:post).permit(:title, :body, :category_id)
    end
end
