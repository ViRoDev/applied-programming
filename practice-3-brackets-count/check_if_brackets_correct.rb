BRACKETS = Hash['(' => ')', '[' => ']', '{' => '}']
def find_close_bracket_index(string)
  opened = string.split('').at(0)
  closed = BRACKETS[opened]
  return nil if closed == nil
  num_of_opened = 0

  string.split('').each.with_index do |br, idx|
    if br == opened
      num_of_opened = num_of_opened + 1
    end

    if br == closed
      num_of_opened = num_of_opened - 1

      return idx if num_of_opened == 0
    end
  end
  return nil
end

puts find_close_bracket_index('(())')

def check_if_brackets_correct(string)
  first_symbol = string.split('').at(0)
  return true if first_symbol == nil

  closed_idx = find_close_bracket_index(string)
  return false if closed_idx == nil

  if closed_idx == 1 
    inside_correct = true
  else
    inside = 1..(closed_idx-1)
    inside_str = string[inside]
    inside_correct = check_if_brackets_correct(inside_str)
  end

  outside = (closed_idx+1)..(string.length - 1)
  outside_str = string[outside].strip
  ouside_correct = check_if_brackets_correct(outside_str)

  return inside_correct && ouside_correct
end

