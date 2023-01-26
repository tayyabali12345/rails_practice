# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_answer, only: %i[dislike like]

  def create
    if answer.save
      redirect_to root_path, notice: t('success')
    else
      render :new
    end
  end

  def like
    @approval = Approval.find_by(approvable: @answer, user_id: current_user.id)
    if @approval.nil?
      Approval.create(approvable: @answer, user_id: current_user.id, like: true)
    else
      @approval.update(like: true, dislike: false)
    end
    redirect_to root_path
  end

  def dislike
    @approval = Approval.find_or_initialize_by(approvable: @answer, user_id: current_user.id)
    if @approval.save(dislike: true)
      # Approval.create(approvable: @answer, user_id: current_user.id, dislike: true)
    else
      # @approval.update(dislike: true, like: false)
    end

    redirect_to root_path
  end

  private

  def answer
    @answer = current_user.answers.new(answer_params)
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def answer_params
    params.require(:answer).permit(:description, :question_id)
  end
end
