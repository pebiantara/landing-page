class MailSubscription < ActiveRecord::Base
  validates_presence_of :email, message: "Email can't be blank"
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Invalid email address.'
  validates_uniqueness_of :email, message: "Oops! We are currently waitlisting new subscribers, and will notify you when openings are available. Thank you :)"
end