# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params) { |c| c.user_id = current_user.id }
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @post = Post.find(params[:id])
    return if current_user.id != @post.user_id || Time.now - @post.created_at > 600
  end

  def update
    @post = Post.find(params[:id])
    redirect_to posts_url if current_user.id == @post.user_id && @post.update(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :picture)
  end
end
