class UserMailer < ApplicationMailer
  default from: "santovaralstore@gmail.com"

  def contact_form(name, email, message)
    @message = message
    mail(from: email,
      to: 'santovaralstore@gmail.com',
      subject: "A new contact form message from #{name}")
    end

    def welcome(user)
      @appname = "Santo Varal Store"
      mail(to: user.email,
        subject: "Welcome to #{@appname}!")

        def payment_confirmation(user,order)
          @user = user
          @order = order
          mail(to: user.email, subject: "Order has been received")
        end
      end
    end
