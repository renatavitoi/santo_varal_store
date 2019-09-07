 class SimplePagesController < ApplicationController
  def index
  end

  def thank_you
     @name = params[:name]
     @email = params[:email]
     @message = params[:message]
      ActionMailer::Base.mail(from: @email,
         to: 'santovaralstore@gmail.com',
         subject: "A new contact from message from #{@name}",
         body: @message).deliver_now
    end

    def landing_page
       @products = Product.limit(3)
     end
  end
