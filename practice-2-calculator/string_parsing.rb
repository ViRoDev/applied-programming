# frozen_string_literal: true

require_relative 'arithmetic_operators'

OPERATOR_REGEX = Regexp.new(
  ARITHMETIC_OPERATORS
  .map { |_, symbol| "\\#{symbol}" }
  .join('|')
).freeze

OPERAND_REGEX = /\d+[.]*\d*/.freeze
OPERATION_REGEX = /^(?<operand_l>#{OPERAND_REGEX})(?<operator>#{OPERATOR_REGEX})(?<operand_r>#{OPERAND_REGEX})/.freeze

def parse_string(str)
  raise 'string is empty' if str.empty?

  operands = str.scan(OPERAND_REGEX)
  raise 'No operands found!' if operands.empty?
  raise 'Operation requires 2 operands, not 1!' if operands.length == 1
  raise 'Too many operands!' if operands.length > 2

  operand_l = operands[0]
  operand_r = operands[1]

  operators = str.gsub(OPERAND_REGEX, '')
  raise 'No operator found!' if operators.empty?
  raise 'Too many operators!' if operators.length > 1

  operator = operators[0]
  raise 'No such operator supported' unless ARITHMETIC_OPERATORS.any? { |_, val| val == operator }

  {
    'operand_l': operand_l,
    'operand_r': operand_r,
    'operator': operator
  }
end
