class PostsController < ApplicationController
	http_basic_authenticate_with name: "zedascouves", password: "123456", except: [:index, :show]

	def index
		@post = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new()
	end

	def create
		@post = Post.new(post_params)
		if(@post.save)
			redirect_to @post
		else
			render 'new'
		end
	end

	private def post_params
		params.require(:post).permit(:title, :body)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if(@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])

		if(@post.destroy)
			redirect_to posts_path
		else
			render 'show'
		end
	end

end
