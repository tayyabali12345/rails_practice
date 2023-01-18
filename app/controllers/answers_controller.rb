# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_ids, only: %i[destroy update]
  before_action :set_comment, only: %i[create]

  def edit
    @product = Product.find(params[:id])
    @comment = Comment.find(params[:product_id])
  rescue StandardError
    flash['alert'] = 'Sorry comment was not found. Please try again'
    redirect_to root_path
  end

  def create
    respond_to do |format|
      if @answer.save
        format.html { redirect_to root_path, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(likes: likes+1)
        format.html { redirect_to product_path(@product), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comm.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comments.destroy
        format.html { redirect_to product_path(@product), notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to products_path, status: :unprocessable_entity }
        format.json { render json: @comm.errors, status: :unprocessable_entity }
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
    byebug
    @answer = Answer.find(params[:id])
  rescue StandardError
    flash['alert'] = 'Sorry answer was not found. Please try again'
    redirect_to root_path
  end

  def comment_params
    params.require(:answer).permit(:description)
  end
end
