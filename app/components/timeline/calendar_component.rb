# frozen_string_literal: true

class Timeline::CalendarComponent < ViewComponent::Base
    attr_reader :contacts
    def initialize(contacts:, user:)
        @contacts = contacts
        @user = user
    end

    def calendar
      dates = (Date.today..Date.today + 30.day).to_a
      meetups = Meetup.where(user: @user).group_by_day(series: true) { |m| m.meetup_day }
      dates.map do |date|
        {
          meetups: meetups[date],
          day: date
        }
      end
    end

    def day_display(day)
      case day
      when Date.today then 'Today'
      when Date.today + 1.day then 'Tomorrow'
      else
        day.strftime('%A, %b %d')
      end
    end
end
