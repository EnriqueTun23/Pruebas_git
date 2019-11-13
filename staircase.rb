#!/bin/ruby

require 'json'
require 'stringio'

# Complete the staircase function below.
def staircase(n)
  hashtag_counter = 1
  space_counter = n - 1
  while hashtag_counter <= n
    puts (" " * space_counter + "#" * hashtag_counter)
    hashtag_counter += 1
    space_counter -= 1
  end
end

n = gets.to_i

staircase n
