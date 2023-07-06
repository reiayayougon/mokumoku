# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :set_user, only: %i[followings followers]
    before_action :set_user, only: %i[followings followers]
  # フォローする時
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    @users = user.followings
  end

  # フォロワー一覧
  def followers
    @users = user.followers
  end

  private

  def set_user
    user = User.find(params[:user_id])
  end
end
