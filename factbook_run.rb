#!/usr/bin/ruby

require "pry"
require 'xmlsimple'
Dir['./lib/**/*.rb'].each { |path| require path }

f = Factbook.new

take_input = lambda do
  puts "Which Answer would you like? Type in the number 1 2 or 3 or the word quit\n"
  print '>'
  input = gets.chomp
  puts "Thanks for trying this out!! Goodbye Sir!" and return if input == 'quit'
  if input =~ /1|2|3|\i/
    case input
    when '1'
      f.most_populated_country
      puts "\n"
      take_input.call
    when '2'
      puts "5 Countries w/ Hightest Inflation rate in 1996 are:"
      f.most_inflated_countries
      puts "\n"
      take_input.call
    when '3'
      puts "Continent w/ Countries Alphabetized:"
      f.continents_with_countries
      take_input.call
    end
  else
    puts "Sorry #{input} is not a recognizeable command. Let's Try Again."
    take_input.call
  end
end
take_input.call