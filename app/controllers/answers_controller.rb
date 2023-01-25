# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_session, only: %i[dislike like]
  before_action :set_answer, only: %i[dislike like]

  def create
    respond_to do |format|
      if answer.save
        format.html { redirect_to root_path, notice: t('success') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def like
    @answer.increment(:likes, 1)
    @answer.save
    session[:answer_likes].append(@answer.id)
    redirect_to root_path
  end

  def dislike
    @answer.increment(:dislikes, 1)
    @answer.save
    session[:answer_dislikes].append(@answer.id)
    redirect_to root_path
  end

  private

  def answer
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def answer_params
    params.require(:answer).permit(:description)
  end

  def set_session
    session[:answer_dislikes] ||= []
    session[:answer_likes] ||= []
  end
end
