module Jekyll
  module RocCalendarFilter
    def roc_calendar(date)
      "民國#{date.year - 1911}年#{date.month}月#{date.day}日" if date
    end
  end
end

Liquid::Template.register_filter(Jekyll::RocCalendarFilter)