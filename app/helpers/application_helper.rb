module ApplicationHelper
  def nice_date(date)
    date.strftime('%B %d, %Y') unless date.nil?
  end
end
