# frozen_string_literal: true

class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show edit update destroy]
  before_action :set_flag, only: %i[update]
  before_action :set_create, only: %i[create]

  def index
    @searched = Topic.ransack(params[:q])
    @topics = @searched.result(distinct: true)
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    respond_to do |format|
      if @topic.save
        format.html { redirect_to topic_path(@topic), notice: 'topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  rescue StandardError
    flash['alert'] = 'Sorry topic was not found. Please try again'
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
