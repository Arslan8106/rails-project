class SubscriberMailer < ApplicationMailer

    default from: 'arslanahmad8106@gmail.com'

    def welcome_subscriber
        
      @subscriber = params[:name]
      @url  = 'http://127.0.0.1:3000/'
      mail(to: @subscriber.email, subject: 'Welcome to My Rails Blog Site')
    end

end
