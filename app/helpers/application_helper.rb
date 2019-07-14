module ApplicationHelper
  def vietnamese_currency(price)
    number_to_currency(price, unit: 'đ', seperator: ',', format: "%n %u")
  end
end
