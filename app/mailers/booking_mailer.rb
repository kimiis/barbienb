class BookingMailer < ApplicationMailer
  default from: 'no-reply@barbie_nb.com'

  def booking_request
    @booking = params[:booking]
    @user = @booking.user
    @house = @booking.house
    mail(to: @booking.user.email, subject: 'Your reservation')
  end
end
