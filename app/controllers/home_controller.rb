class HomeController < ApplicationController
  def index
    @subscription = MailSubscription.new
  end
end