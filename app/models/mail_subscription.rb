class MailSubscription < ActiveRecord::Base
  validates_presence_of :email, message: "Email can't be blank"
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Invalid email address.'
  validates_uniqueness_of :email, message: "You are already in our waiting list. Will notify you when openings are available. Thank you : )"
end