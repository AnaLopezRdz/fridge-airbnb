class BookingConfirmationMailer < ApplicationMailer
  default from: "officewhereyouare@gmail.com"

  def confirmation_email(user, booking)
    @user = user
    @booking = booking
    @office = @booking.office
    mail(to: @user.email, subject: "Your booking confirmation")
  end
end
