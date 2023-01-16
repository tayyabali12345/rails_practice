# frozen_string_literal: true

class HomesController < ApplicationController
  def show
  @searched = Topic.ransack(params[:q])
  @products = @searched.result(distinct: true)

  @questions = Question.eager_load(:answers)
  end
end
