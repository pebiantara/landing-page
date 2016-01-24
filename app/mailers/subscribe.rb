class Subscribe < ApplicationMailer

  def subscription(email)
    mail(
      :to => email, 
      :subject => "GiftForWin - subscribed"
    )
  end
end
