#!/bin/ruby

require 'json'
require 'stringio'

# Complete the birthday function below.
def birthday(bar_chocolate, birth_day, birth_month)
   cont_day = 0
   cont_concidenc = 0

  bar_chocolate.length.times do |piece_chocolate|
    cont_day += bar_chocolate[piece_chocolate]
    cont_day -= bar_chocolate[piece_chocolate - birth_month] if (piece_chocolate > (birth_month - 1)) 
    cont_concidenc = cont_concidenc + 1 if (piece_chocolate >= (birth_month - 1) && cont_day == birth_day) 
  end   

  cont_concidenc
end
fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.strip.to_i

s = gets.rstrip.split.map(&:to_i)

dm = gets.rstrip.split

birth_day = dm[0].to_i

birth_month = dm[1].to_i

result = birthday s, birth_day, birth_month

fptr.write result
fptr.write "\n"

fptr.close()
