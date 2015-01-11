module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "MotoRent"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  #sortable column
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end


  # QR code generation - Google
  def qr_code(size, url)
    "https://chart.googleapis.com/chart?cht=qr&chs=#{size}x#{size}&chl=#{url}"
  end

# Change Country all for Countries module
module ISO3166
  def Country.correct_country(&blk)
    if I18n.locale == (:en && :it && :de && :fr && :es && :ja && :nl && :ru )
      blk ||= Proc.new { |country ,data| [data['translations']["#{I18n.locale}"] + ' (+' + data['country_code'] + ')', '+' + data['country_code']] }
      Country::Data.map &blk
    else
      blk ||= Proc.new { |country ,data| [data['translations']['en'] + ' (+' + data['country_code'] + ')', '+' + data['country_code']] }
      Country::Data.map &blk
    end
  end

  def Country.correct_currency(&blk)
    blk ||= Proc.new { |country ,data| [data['name'] + ' (+' + data['country_code'] + ')', data['currency']] }
    Country::Data.map &blk
  end

  def Country.correct_alpha2(&blk)
    blk ||= Proc.new { |country ,data| [data['name'] + ' (+' + data['country_code'] + ')', data['alpha2']] }
    Country::Data.map &blk
  end
end

  # Time format
  def time_format(time, timezone)
    #browser_time_zone ||= javascript_tag("getTimezoneName();")
    if timezone.nil?
      time_zone = nil
    else
      time_zone = ActiveSupport::TimeZone.new(timezone)
    end
    if timezone.nil? || timezone.blank?
      time.strftime("%d/%m/%Y - %H:%M:%S (%z)")
    elsif time_zone.nil?
      time.strftime("%d/%m/%Y - %H:%M:%S (%z)")
    else
      time.in_time_zone(timezone).strftime("%d/%m/%Y - %H:%M:%S")
    end
  end

  def time(time)
    time.strftime("%H:%M (%z)")
  end

  def date(date)
    date.strftime("%d/%m/%Y - (%z)")
  end

  def card_format_number(number)
    new_number = "************#{number[12..16]}"
  end

  def card_format_cvv(cvv)
    new_number = "***"
  end

  def sum_format(number)
    new_number = number_with_precision(number, precision: 2)
  end

end
