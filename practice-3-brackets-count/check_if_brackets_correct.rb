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

require 'test/unit'
class TestBrackets < Test::Unit::TestCase
    def test_one_pair_square
        assert_equal true, check_if_brackets_correct('[]')
    end
    
    def test_one_pair_curly
        assert_equal true, check_if_brackets_correct('{}')
    end

    def test_one_pair_round
        assert_equal true, check_if_brackets_correct('()')
    end

    def test_equal
        assert_equal true, check_if_brackets_correct('({})')
        assert_equal true, check_if_brackets_correct('{[()]}')
        assert_equal true, check_if_brackets_correct('[{}(())]')
    end

    def test_not_closed
        assert_equal false, check_if_brackets_correct('[[')
        assert_equal false, check_if_brackets_correct('[[]')
    end

    def test_not_opened
        assert_equal false, check_if_brackets_correct('[]{)}')
        assert_equal false, check_if_brackets_correct('){}{}')
    end
end