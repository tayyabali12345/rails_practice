# frozen_string_literal: true

class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show]
  before_action :set_create, only: %i[create]

  def index
    @searched = Topic.ransack(params[:q])
    @topics = @searched.result(distinct: true)
  end

  def show; end

  def new
    @topic = Topic.new
  end

  def create
    respond_to do |format|
      if @topic.save
        format.html { redirect_to topic_path(@topic), notice: t('success') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  rescue StandardError
    flash['alert'] = t('alert')
    redirect_to root_path
  end

  def set_create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
  end

  def topic_params
    params.require(:topic).permit(:title, :description, :image)
  end
end
