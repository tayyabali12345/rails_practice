# frozen_string_literal: true

class FollowingsController < ApplicationController
  def create
    @topic_followed = current_user.user_topics.new(topic_id: params[:topic_id])
    respond_to do |format|
      if @topic_followed.save
        format.html { redirect_to topics_path, notice: t('success') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if current_user.user_topics.find_by(topic_id: params[:id]).delete
        format.html { redirect_to topics_path, notice: t('destroy') }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
      end
    end
  end
end
