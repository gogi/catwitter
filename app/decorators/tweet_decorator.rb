class TweetDecorator < Draper::Decorator
  delegate_all

  def ago
      now = DateTime.now
      difference = TimeDifference.between(now, created_at)
      if difference.in_days >= 1
        "#{difference.in_days.to_int} days ago"
      else
        if difference.in_hours >= 1
          "#{difference.in_hours.to_int} hours ago"
        else
          "#{difference.in_minuts.to_int} hours ago"
        end
      end
  end
end
