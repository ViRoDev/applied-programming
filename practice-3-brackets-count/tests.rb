require_relative 'check_if_brackets_correct'
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

    def test_examples_from_task
      assert_equal true, check_if_brackets_correct('(){}[]') 
      assert_equal true, check_if_brackets_correct('([{}])') 
      assert_equal false, check_if_brackets_correct('(}') 
      assert_equal false, check_if_brackets_correct('[(])') 
      assert_equal false, check_if_brackets_correct('[({})](]')
    end
end