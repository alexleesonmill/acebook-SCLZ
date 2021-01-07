# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post

  def create
    unless current_user.nil?
      if already_liked?
        @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
        @like.destroy
      else
        @post.likes.create(user_id: current_user.id)
      end
      redirect_to posts_url
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
