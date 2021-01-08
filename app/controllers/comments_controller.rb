# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_post, only: %i[create edit update]
  before_action :find_comment, only: %i[edit update]
  respond_to :js, :html, :json

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    return unless current_user.id != @comment.user_id || Time.now - @comment.created_at > 600

    flash[:notice] = 'You cannot edit this post'
    redirect_to posts_url
  end

  def create
    @comment = @current_post.comments.create(comment_params) { |c| c.user_id = current_user.id }
    redirect_to posts_url
  end

  def update
    @comment = Comment.find(params[:id])
    redirect_to posts_url if current_user.id == @comment.user_id && @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    return unless current_user.id == @comment.user_id

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def like
    @comment = Comment.find(params[:id])
    case params[:format]
    when 'like'
      @comment.liked_by current_user
    when 'unlike'
      @comment.unliked_by current_user
    end
  end

  private

  def find_post
    @current_post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @current_post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :body)
  end
end
