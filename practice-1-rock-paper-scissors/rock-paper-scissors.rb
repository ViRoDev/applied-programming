# User Input
input_options = ["paper", "rock", "scissors"]
puts "Enter your choice [Paper|Rock|Scissors]:" 

user_str = nil
is_input_proper = false
while(!is_input_proper)
  user_str = STDIN.gets.chomp.downcase
  is_input_proper = input_options.include?(user_str)
  if !is_input_proper
    puts "please enter proper input! [Paper|Rock|Scissors]"
  end
end
user_val = input_options.find_index(user_str)

# Computer's turn
computer_val = rand 2
computer_str = input_options[computer_val]
puts "Computer turn is: #{computer_str}"

# Game logic
if user_val == computer_val
  puts "Draw"
elsif user_val == 0 && computer_val == 1
  puts "You Win!"
elsif user_val == 1 && computer_val == 2
  puts "You Win!"
elsif user_val == 2 && computer_val == 0
  puts "You Win!"
else 
  puts "You Lost..."
end
