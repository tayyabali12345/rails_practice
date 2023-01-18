# frozen_string_literal: true

class FollowingsController < ApplicationController
  def create
    @topic_followed=current_user.user_topics.new(topic_id: params[:topic_id])
    respond_to do |format|
      if @topic_followed.save
        format.html { redirect_to topics_path, notice: 'Topic was successfully Followed.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if current_user.user_topics.find_by(topic_id: params[:id]).delete
        format.html { redirect_to topics_path, notice: 'You successfully unfollowed the topic' }
        format.json { head :no_content }
      else
        format.html { redirect_to products_path, status: :unprocessable_entity }
      end
    end
  end
end
