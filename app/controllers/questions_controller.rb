# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show]
  before_action :set_params, only: %i[create]
  before_action :set_session, only: %i[dislike like]
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
    @question.increment(:dislikes, 1)
    @question.save
    session[:question_dislikes].append(@question.id)
    redirect_to root_path
  end

  def like
    @question.increment(:likes, 1)
    @question.save
    session[:question_likes].append(@question.id)
    redirect_to root_path
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def set_question
    @question = Question.find(params[:id])
    @answers = @question.answers.order(likes: :desc)
  end

  def set_session
    session[:question_likes] ||= []
    session[:question_dislikes] ||= []
  end

  def set_params
    @question = Question.new(question_params)
    @question.user_id = current_user.id
  end

  def question_params
    params.require(:question).permit(:subject, :description)
  end
end
