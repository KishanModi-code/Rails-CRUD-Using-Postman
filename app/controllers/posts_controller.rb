class PostsController < ApplicationController
  before_action :set_user, except: [:all]
  before_action :set_post, only: [:show, :update, :destroy,]

  # GET /users/:user_id/posts
  def index
  @posts = @user.posts
  render json: @posts
 end

 def all
    @posts = Post.all
    render json: @posts
  end

  # GET /users/:user_id/posts/:id
  def show
    render json: @post
  end

  # POST /users/:user_id/posts
  def create
    @post = @user.posts.build(post_params)

    if @post.save
      render json: {message: 'Post Created Sucessfully'} , status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:user_id/posts/:id
  def update
    if @post.update(post_params)
      render json: {message: 'Post Updated Sucessfully', post: @post}
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /users/:user_id/posts/:id
  def destroy
    @post
    if @post.destroy
      render json: {message: 'Post Deleted Sucessfully'}, status: :ok
    else
      render json: {errors: 'Sorry, Post Alredy Deleted'}, status: :not_found
    head :no_content
   end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User with ID #{params[:user_id]} not found" }, status: :not_found
  end

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post with ID #{params[:id]} not found OR Alredy Deleted" }, status: :not_found
  end

  def post_params
    params.require(:post).permit(:title, :discription)
  end
end


