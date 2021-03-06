class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.newest
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    unless user_author(@post.user)
      redirect_to root_path, notice: 'Нет прав доступа'
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
        respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    if can_user_vote?
      @post = Post.find(params[:id])
      rating = Rating.new
      rating.user = current_user
      rating.post = @post
      @post.rating = @post.rating.to_i + 1 unless user_author(@post.user)
      rating.save
      @post.save
    end
  end

  def dislike
    if can_user_vote?
      @post = Post.find(params[:id])
      rating = Rating.new
      rating.user = current_user
      rating.post = @post
      @post.rating = @post.rating.to_i - 1 unless user_author(@post.user)
      rating.save
      @post.save
    end
  end

  def best
    @post = Post.all.where("rating >= '10'")
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :image, :rating)
    end

    def can_user_vote?
      @rated_by = Rating.where(user_id: current_user.id, post_id: params[:id])
      @rated_by.blank?
    end
  end
