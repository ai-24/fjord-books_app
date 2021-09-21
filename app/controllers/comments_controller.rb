class CommentsController < ApplicationController

  def create
    comment = @commentable.comments.build(comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to @commentable
  end

  def update

  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
