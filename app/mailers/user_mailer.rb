class UserMailer < ApplicationMailer
  default from: "cool.snow.mail@gmail.com"
  def new_comment_alerm(comment)
    @comment = comment
    mail(to: 'cool.snow.mail@gmail.com', subject: "there is a new comment")
  end
end