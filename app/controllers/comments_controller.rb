# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable
    else
      render '/comments/_error_messages'
    end
  end

  def edit; end

  def update
    @comment.update(comment_params)
    redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
  end

  def destroy
    if @comment.destroy
      redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
    else
      redirect_to @commentable, alert: t('errors.no_authority')
    end
  end

  private

  def set_comment
    @comments = current_user.comments
    if @comments.exists?(params[:id])
      @comment = @comments.find(params[:id])
    else
      render inline: '<h1><%= "このコメントは編集できません" %></h1>'
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
