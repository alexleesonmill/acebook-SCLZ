# frozen_string_literal: true

class FriendsController < ApplicationController
  def requests
    @friend_requests = current_user.requested_friends
  end

  def add
    current_user.friend_request(User.find(params[:id]))
    redirect_to custom_user_posts_path(params[:id])
  end

  def accept
    current_user.accept_request(User.find(params[:id]))
    redirect_to friend_requests_path
  end

  def decline
    current_user.decline_request(User.find(params[:id]))
    redirect_to friend_requests_path
  end

  def list
    @friends_list = User.find(params[:id]).friends
  end
end
