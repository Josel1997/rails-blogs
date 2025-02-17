class BlogPostsController < ApplicationController
    def index
        @blog_posts = BlogPost.all
    end

    def show
        @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new
        @blog_post = BlogPost.new
    end

    def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
            head :created
            #redirect_to @blog_post
        else
            render :new, status: 422
        end
    end

    def count
        @blog_post_count = BlogPost.count
    end

    private

    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end


end