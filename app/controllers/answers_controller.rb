class AnswersController < ApplicationController

  def create
    question = Question.find(params[:answer][:question_id])
    answer = question.answers.create(answer_params)

    MainMailer.notify_question_author(answer).deliver_later


    session[:current_user_email] = answer_params[:email]
    redirect_to question
  end

  private
  def answer_params
    params.require(:answer).permit(:question_id, :email, :body)
  end

end
