require 'date'

def date_calculator(date1, date2, day)
    months_difference = date2.month - date1.month
    sum_months = months_difference + 1
    result = []
    month = 1
    while month <= sum_months do
      result.push(Date.new(date1.year, month, day).strftime("%d %b %y")) 
      month += 1
    end
    result
end

date_calculator(Date.new(2018,01,2), Date.new(2018,05,5), 4)