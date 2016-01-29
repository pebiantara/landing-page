class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :lottery_amounts

  def lottery_amounts
    Rails.cache.fetch("lottery_amounts", expires_in: 12.hours) do
      scrap = Scrapper.new
      scrap.get_amount_lottery
    end
    Rails.cache.read("lottery_amounts")
 end
end
