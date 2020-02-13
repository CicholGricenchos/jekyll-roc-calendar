module Jekyll
  module RocCalendarFilter
    DIGITS = %w{〇 一 二 三 四 五 六 七 八 九}

    def self.year_number integer
      integer.digits.reverse.map{|x| DIGITS[x]}.join
    end

    def self.month_number integer
      unit, ten = integer.digits
      if ten.nil?
        ten = ''
      elsif ten == 1
        ten = '十'
      else
        ten = DIGITS[ten] + '十'
      end
      unit = DIGITS[unit]
      ten + unit
    end

    def roc_calendar(date)
      if date
        year = RocCalendarFilter.year_number date.year - 1911
        month = RocCalendarFilter.month_number date.month
        day = RocCalendarFilter.month_number date.day
        "民國#{year}年#{month}月#{day}日"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::RocCalendarFilter)