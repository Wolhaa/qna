class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit new update destroy]
  def index
    @question = Question.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to question_path
  end

  private

  def set_question
    @question ||= params[:id] ? Question.find(params[:id]) : Question.new
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
