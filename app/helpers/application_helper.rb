module ApplicationHelper

  def powerball_jackpot
    #Every Wednesday and Saturday night at 10:59 p.m
    calculate_date(2, 5, "10:59")
  end

  def mega_jackpot
    # Tuesday and Friday at 11:00 p.m
    calculate_date(1, 4, "10:59")
  end

  def lotto_jackpot
    # Every Wednesday and Saturday night
    calculate_date(2, 5, "10:59")
  end

  def calculate_date(index_day_1, index_day_2, jackpot_time)
    next_jackpot = array_days_of_the_week[index_day_1]
    jackpot_date = Time.parse(next_jackpot.to_s + " #{jackpot_time}").in_time_zone.strftime("%d %b %Y %H:%M:00 EST")
    now = Time.now
    if jackpot_date < now.in_time_zone.strftime("%d %b %Y %H:%M:00 EST")
      next_jackpot = array_days_of_the_week[index_day_2]
      jackpot_date = Time.parse(next_jackpot.to_s + " #{jackpot_time}").in_time_zone.strftime("%d %b %Y %H:%M:00 EST")
      if jackpot_date < now.in_time_zone.strftime("%d %b %Y %H:%M:00 EST")
	      next_jackpot = array_days_of_the_week(true)[index_day_1]
	      jackpot_date = Time.parse(next_jackpot.to_s + " #{jackpot_time}").in_time_zone.strftime("%d %b %Y %H:%M:00 EST")
        return jackpot_date
      end
      return jackpot_date
    end
    jackpot_date
  end

  def array_days_of_the_week(next_week=false)
    Time.zone = "Eastern Time (US & Canada)"
    a = next_week ? Date.today + 1.week : Date.today
    (a.at_beginning_of_week..a.at_end_of_week).map.each{|x| x}
  end
end