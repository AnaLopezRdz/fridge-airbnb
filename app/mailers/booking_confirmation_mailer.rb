class BookingConfirmationMailer < ApplicationMailer
  default from: "officewhereyouare@gmail.com"

  def confirmation_email(user, booking)
    @user = user
    @office = booking.office
    @booking = booking
    mail(to: @user.email, subject: "Your booking confirmation")
  end
end
