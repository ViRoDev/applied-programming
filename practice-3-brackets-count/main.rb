def check_if_brackets_correct(string)
  open_round_brackets = 0
  open_square_brackets = 0
  open_curly_brackets = 0

  string.split('').each do |symbol|
    case symbol
      when '('
        open_round_brackets+=1
      when ')'
        open_round_brackets-=1
       when '['
        open_square_brackets+=1
      when ']'
        open_square_brackets-=1
      when '{'
        open_curly_brackets+=1
      when '}'
        open_curly_brackets-=1
    else 
        # should not be possible to raise, but what if...
        raise "Symbol #{symbol} not supported"
    end

    return false  if open_curly_brackets < 0 || open_round_brackets < 0  || open_square_brackets < 0
  end

  return true if open_curly_brackets == 0 && open_round_brackets == 0 && open_square_brackets == 0

  return false 
end

test_1 = "[[]]]()"

puts check_if_brackets_correct(test_1)

