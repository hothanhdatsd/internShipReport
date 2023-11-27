# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'hothanhdatsd@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
