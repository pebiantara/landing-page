module ApplicationHelper

  def powerball_jackpot
    # Saturday night at 10:59 p.m. Eastern Time
    powerball_date = array_days_of_the_week[3]
    Time.parse(powerball_date.to_s + " 10:59 pm").in_time_zone.strftime("%d %b %Y %H:%M:00 EST")    
  end

  def mega_jackpot
    # Tuesday and Friday at 11:00 p.m
    mega_date = array_days_of_the_week[4]
    Time.parse(mega_date.to_s + " 11:00 pm").in_time_zone.strftime("%d %b %Y %H:%M:00 EST")
  end

  def lotto_jackpot
    # Saturday night at 11:15 p.m.
    lotto_date = array_days_of_the_week[5]
    Time.parse(lotto_date.to_s + " 11:15 pm").in_time_zone.strftime("%d %b %Y %H:%M:00 EST")
  end

  def array_days_of_the_week
    Time.zone = "Eastern Time (US & Canada)"
    a = Date.today
    (a.at_beginning_of_week..a.at_end_of_week).map.each{|x| x}
  end
end