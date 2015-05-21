class AnswersController < ApplicationController

  def create
    # find question
    question = Question.find(params[:answer][:question_id])
    # create new answer
    question.answers.create(answer_params)
    # redirect the question page
    redirect_to question
  end

  def answer_params
    params.require(:answer).permit(:question_id, :email, :body)
  end

end
