class CommentsController < ApplicationController

    def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_url, notice: 'Comment was successfully created.' }
        format.js { }
      end
    end
    end

    def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
   end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:text)
  end

 end
