# Preview all emails at http://localhost:3000/rails/mailers/main_mailer
class MainMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/main_mailer/notify_question_author
  def notify_question_author
    question = Question.create email: 'author@question.com', body: 'a test question'
    answer = Answer.create email: 'author@answer.com', body: 'a test answer'

    question.answers << answer

    mail = MainMailer.notify_question_author(Answer.first)

  end

end
