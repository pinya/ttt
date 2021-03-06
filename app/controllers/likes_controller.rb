class LikesController < ApplicationController
  def like_toggle
    @likes = current_user.likes.where(stuff_id: params[:stuff_id])
    if like = @likes.first
      if bucket = Bucket.find_by(user: current_user, stuff_id: params[:stuff_id])
        bucket.destroy
      end
      like.destroy
      render :unlike
    else
      Bucket.create(user: current_user, stuff_id: params[:stuff_id])
      current_user.likes.create!(stuff_id: params[:stuff_id])
      render :like
    end
  end
end
