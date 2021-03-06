class CommentsController < ApplicationController
  # POST /posts/[post_id]/comments
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_params)

    redirect_to post_path(@post)
  end

  # DELETE /posts/[post_id]/comments/:id
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private
  def comments_params
    params.require(:comment).permit(:commenter, :body)
  end
end
