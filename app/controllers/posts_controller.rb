class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new 
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to :root
		else
			render :new, status: :unprocessable_entity
		end
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :user_id)
		end
end
