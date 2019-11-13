#!/bin/ruby

require 'json'
require 'stringio'

# Complete the plusMinus function below.
def plusMinus(arr)
   positives = arr.count {|number| number.positive?}
   negatives = arr.count {|number| number_negative.negative?}
   zeros = arr.count {|numeber| number.zero?}
   total_number = arr.size
   
   puts positives.fdiv(total_number)
   puts negatives.fdiv(total_number)
   puts zeros.fdiv(total_number)
end

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

plusMinus arr