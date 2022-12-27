require_relative 'top_three.rb'
require 'test/unit'

class TestTopThree < Test::Unit::TestCase
    def test_empty
        assert_equal 0, find_top_three_words('').length
    end

    def test_two
        assert_equal ['a', 'b'], find_top_three_words('a a b')
    end

    def test_examples_from_task
      text = "In a#village234 of La Mancha,\
        the name of which I have no desire to call to mind, \
        there lived not long since one of those gentlemen that keep a lance in the lance-rack, \
        an old buckler, a lean hack, and a greyhound for coursing. \
        An olla of rather more beef than mutton, \
        a salad on most nights, scraps on Saturdays, \
        lentils on Fridays, and a pigeon or so extra on Sundays, \
        made away with three-quarters of his income."

      assert_equal ['a', 'of', 'on'], find_top_three_words(text)
    end
end
