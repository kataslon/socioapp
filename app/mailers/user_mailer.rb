class UserMailer < ApplicationMailer
  default from: 'kataslon@yandex.ru'

  def welcome_email(user)
    @user = user
    @url  = 'http://socioapp.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site! Your password is '+"#{@user.password}")
  end

  def change_password_email(user)
    @user = user
    @url  = 'http://socioapp.com/login'
    mail(to: @user.email, subject: 'Your new password is '+"#{@user.password}")
  end
end
