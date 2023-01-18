class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show]
  before_action :set_create, only: %i[create]

  def index
    @questions = Topic.find(params[:topic_id]).questions
  end

  def create
    topic = params.require(:tag_ids)
    topic.each {|x| @question.topic_questions.new(topic_id: x)}
    respond_to do |format|
      if @question.save
        format.html { redirect_to root_path, notice: 'question was successfully created.' }
        #format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
  end
  
  def new
    @question = Question.new
    @topics = Topic.all
  end

  private

  def set_question
    @question = Question.find(params[:id])
    @answers = @question.answers.order(likes: :desc)
  rescue StandardError
    flash['alert'] = 'Sorry Question was not found. Please try again'
    redirect_to root_path
  end

  def set_create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
  end

  def question_params
    params.require(:question).permit(:subject, :description)
  end
end
