class UserMailer < ApplicationMailer
  default from: 'kataslon@yandex.ru'

  def welcome_email(user)
    @user = user
    @url  = 'http://socioapp.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site! Your password is '+"#{@user.password}")
  end
end
