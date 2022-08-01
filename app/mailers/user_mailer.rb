class UserMailer < ApplicationMailer

    default from: 'arslanahmad8106@gmail.com'

    def welcome_email
      @user = params[:username]
      @url  = 'http://127.0.0.1:3000/'
      mail(to: @user.email, subject: 'Welcome to My Rails Blog Site')
    end
  
end
