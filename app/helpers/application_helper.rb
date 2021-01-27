module ApplicationHelper
  def nice_date(date)
    date.strftime('%B %d, %Y') unless date.nil?
  end

  def nice_compact_date(date)
    date.strftime('%d-%b-%y') unless date.nil?
  end
end
