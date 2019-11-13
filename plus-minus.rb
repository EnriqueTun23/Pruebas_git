#!/bin/ruby

require 'json'
require 'stringio'

# Complete the plusMinus function below.
def plusMinus(arr)
   total_number = arr.size
   
   positives = arr.count {|number| number.positive?}
   negatives = arr.count {|number| number.negative?}
   zeros = arr.count {|number| number.zero?}
   
   puts positives.fdiv(total_number)
   puts negatives.fdiv(total_number)
   puts zeros.fdiv(total_number)
end

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

plusMinus arr