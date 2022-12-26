POSITION_OF_LOWERCASE_A_IN_ASCII = 97
def alphabet_position(string) 
    lower = string.downcase
    letters = lower.scan /[a-z]/

    numbers = letters.map do |l| 
        # adding one to make 'a' = 1, and not 'a' = 0
        l.ord - POSITION_OF_LOWERCASE_A_IN_ASCII + 1
    end
    return numbers.join(' ')
end

# should be a test
puts alphabet_position("The sunset sets at twelve o'clock.")