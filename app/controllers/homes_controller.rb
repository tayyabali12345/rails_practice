# frozen_string_literal: true

class HomesController < ApplicationController
  before_action :set_user, only: %i[profile]

  def show
    @searched = Topic.ransack(params[:q])
    @products = @searched.result(distinct: true)
    @questions = Question.eager_load(:answers)
  end

  def about
    @user = current_user
    @questions = @user.questions
    @followed_topics = @user.user_topics
  end

  def profile
    @questions = @user.questions
    @answers = @user.answers.eager_load(:question)
  end

  private

  def set_user
    @user = User.find(params[:home_id])
  rescue StandardError
    flash['alert'] = t('alert')
    redirect_to root_path
  end
end
