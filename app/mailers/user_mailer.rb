class UserMailer < ApplicationMailer
default from: "mcreatororganization@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(reservation)
    @message_title=reservation.listing.title
    @message_address=reservation.listing.address
    @message_price=reservation.listing.price
    @message_name=reservation.user.name
    @message_email=reservation.user.email
    @message_gender=reservation.user.gender

    mail to: reservation.user.email,subject:"Sign Up Successfully"
  end
end
