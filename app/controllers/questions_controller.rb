# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show]
  before_action :set_params, only: %i[create]
  before_action :find_question, only: %i[dislike like]

  def index
    @questions = Topic.find(params[:topic_id]).questions
  end

  def show; end

  def new
    @question = Question.new
    @topics = Topic.all
  end

  def create
    topic = params.require(:tag_ids)
    topic.each { |x| @question.topic_questions.new(topic_id: x) }
    respond_to do |format|
      if @question.save
        format.html { redirect_to root_path, notice: t('success') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def dislike
    @approval = Approval.find_by(approvable: @question, user_id: current_user.id)
    if @approval.nil?
      Approval.create(approvable: @question, user_id: current_user.id, dislike: true)
    else
      @approval.update(dislike: true, like: false)
    end
    redirect_to root_path
  end

  def like
    @approval = Approval.find_by(approvable: @question, user_id: current_user.id)
    if @approval.nil?
      Approval.create(approvable: @question, user_id: current_user.id, like: true)
    else
      @approval.update(dislike: false, like: true)
    end
    redirect_to root_path
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def set_question
    @question = Question.include(:answers).find(params[:id])
    @answers = @question.answers.order(likes: :desc)
  end

  def set_params
    @question = Question.new(question_params)
    @question.user_id = current_user.id
  end

  def question_params
    params.require(:question).permit(:subject, :description)
  end
end
