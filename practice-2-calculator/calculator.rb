require_relative 'string_parsing'
require_relative 'calculate'

# User Input
puts 'Enter expression with 2 variables ex(2.3 + 61): '
user_str = STDIN.gets.gsub(/\s+/, '') # removes all white spaces
raise 'No input found!' if user_str.empty?

operation = parse_string(user_str)
res = calculate(operation[:operator], operation[:operand_l], operation[:operand_r])
puts "#{operation[:operand_l]} \
    #{operation[:operator]} \
    #{operation[:operand_r]} = \
    #{res}"