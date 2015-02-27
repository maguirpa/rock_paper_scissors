
puts "\n=====>Welcome to the Rock Paper Scissors Challenge!<====="

CHOICES = {'Paper' => 'p', 'Rock' => 'r', 'Scissors' => 's'}
replay = ' '
game_over = false

def winning_message(message)
  case message
  when 's'
    puts "\nScissors Slicing and Dicing Paper!"
  when 'p'
    puts "\nPaper Hovering and Smothering Rock!"
  when 'r'
    puts "\nRock Shattering and Splattering Scissors!"
  end
end

puts "What's your name?"
name = gets.chomp.capitalize!

while replay != 'n' # Overall game
  computer_choice = CHOICES.values.sample
  user_wins = 0
  computer_wins = 0

   while game_over != true  # current game
    double_or_nothing = false
    game_over = false

    begin
      puts "\nPlease chose one: Rock(r), Paper(p) or Scissors(s)."
      user_choice = gets.chomp.downcase
    end until CHOICES.values.include?(user_choice)

    if user_choice == computer_choice
      puts "Its a tie!"
      if user_wins > 0 || computer_wins > 0
        next
      else
        game_over = true
      end
    elsif user_choice == 'r' && computer_choice == 's' ||
          user_choice == 'p' && computer_choice == 'r' ||
          user_choice == 's' && computer_choice == 'p'
      winning_message(user_choice)
      puts "#{name} wins!"
      user_wins += 1
      double_or_nothing = true
    else
      winning_message(computer_choice)
      puts "Computer wins!"
      computer_wins += 1
      double_or_nothing = true
    end

    if computer_wins == 1 && user_wins == 1
      puts "\nGame is tied! This is for all the marbles!!"
      double_or_nothing = false
    elsif computer_wins == 2
      puts "\nComputer wins the Double or Nothing game!!"
      game_over = true
      double_or_nothing = false
    elsif user_wins == 2
      puts "\n#{name} wins the Double or Nothing game!!"
      game_over = true
      double_or_nothing = false
    end
        
    while double_or_nothing == true
      loop
        puts "\nInterested in Double or Nothing?(y/n)"
        ans = gets.chomp.downcase
      next if ans != 'y' && ans != 'n'

      double_or_nothing = false
      if ans == 'y'
        puts "\nOK, good luck.  Computer is pretty smart though."
      else 
        game_over = true
      end
    end

  end #current game

  begin
    puts "\nWould you like to play again? (y/n)"
    replay = gets.chomp.downcase
  end until replay == 'y' || replay == 'n'

end   #overall game

puts "\nOK. Thanks for playing #{name}. Hope you had a good time."


