
open_round_brackets = 0
open_square_brackets = 0
open_curly_brackets = 0

while true 
    # User Input
    begin
        puts 'Enter *one* bracket symbol or exit:'

        user_str = STDIN.gets.gsub(/\s+/, '')
        break if user_str == 'exit'

        # remove all non-bracket symbols
        user_chr = user_str.gsub(/[^{}()\[\]]/, '')
        raise 'Invalid input' if user_chr.length != 1

    rescue => e
        puts "You entered not 1, but #{user_chr.length} symbols at once\nPlease retry:\n\n" if user_chr.length > 1
        puts "You entered no valid symbol" if user_chr.length === 0
        next
    end

    case user_chr
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
        raise 'Internal logic error'
    end
    raise 'Illigal number of curly brackets!' if open_curly_brackets < 0
    raise 'Illigal number of round brackets!' if open_round_brackets < 0
    raise 'Illigal number of square brackets!' if open_square_brackets < 0
    
end
puts 'Ending program before switch...'

