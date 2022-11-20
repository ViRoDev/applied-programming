require 'bigdecimal'
require_relative 'arithmetic_operators'

def calculate(operation, left_operand, right_operand)
  case operation
  when ARITHMETIC_OPERATORS[:ADDITION]
    add(left_operand, right_operand)
  when ARITHMETIC_OPERATORS[:SUBSTRACTION]
    substract(left_operand, right_operand)
  when ARITHMETIC_OPERATORS[:MULTIPLICATION]
    multiply(left_operand, right_operand)
  when ARITHMETIC_OPERATORS[:DIVISION]
    divide(left_operand, right_operand)
  else
    raise 'No such operation exists'
  end
end

def add(left_operand, right_operand)
  x = BigDecimal(left_operand)
  y = BigDecimal(right_operand)
  res = x + y
  res.to_f
end

def substract(left_operand, right_operand)
  x = BigDecimal(left_operand)
  y = BigDecimal(right_operand)
  res = x - y
  res.to_f
end

def multiply(left_operand, right_operand)
  x = BigDecimal(left_operand)
  y = BigDecimal(right_operand)
  res = x * y
  res.to_f
end

def divide(left_operand, right_operand)
  x = BigDecimal(left_operand)
  y = BigDecimal(right_operand)
  raise ZeroDivisionError if y.zero?

  res = x / y
  res.to_f
end
