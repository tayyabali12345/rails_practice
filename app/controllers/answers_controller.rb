# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_ids, only: %i[update]
  before_action :set_comment, only: %i[create]

  def create
    respond_to do |format|
      if @answer.save
        format.html { redirect_to root_path, notice: 'Answer was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.save
        format.html { redirect_to root_path, notice: 'Answer was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_comment
    @answer = Answer.new(comment_params)
    @answer.user_id= current_user.id
    @answer.question_id = params[:question_id]
  end

  def set_ids
    @answer = Answer.find(params[:id])
    @answer.increment(:likes, 1)
  rescue StandardError
    flash['alert'] = 'Sorry answer was not found. Please try again'
    redirect_to root_path
  end

  def comment_params
    params.require(:answer).permit(:description)
  end
end
