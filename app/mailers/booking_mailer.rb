class BookingMailer < ApplicationMailer
  class BookingMailer < ApplicationMailer
    default from: 'no-reply@barbie_nb.com'

    def booking_request
      @booking = params[:booking]
      mail(to: @booking.user.email, subject: 'Your reservation')
    end
  end

end
