# 1) Players pick Rock Paper or Scissors
# 2) Compare, Case for each of them vs computer, tie if same.

# make sure to make this loop so that you can reference it in a while loop to make sure the correct input was inserted.

CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
puts "\n====>Welcome to the Rocks Paper Scissors Game!<======"

def winning_message (choice)
  case choice
  when 'r'
    puts "Rock crushes Scissors!"
  when 's'
    puts "Scissors shred Paper!"
  when 'p'
    puts "Paper smothers Rock!"
  end
end

#program begins

begin
  players_wins = 0
  computer_wins = 0
  playmore = true

  begin 
    
    repeat = true

    begin # prompt loop
    puts "\nPlease chose one: (p, r, s):"
    user_choice = gets.chomp.downcase
    end until CHOICES.keys.include?(user_choice)

    computer_choice = CHOICES.keys.sample

    if user_choice == computer_choice
      puts "Its a tie!"
      playmore = false
      
    elsif (user_choice == 'p' && computer_choice == 'r') ||
      (user_choice == 'r' && computer_choice == 's') ||
      (user_choice == 's' && computer_choice == 'p')

      winning_message(user_choice)
      puts "You won!"
      players_wins += 1
      playmore = true 
    else
      winning_message(computer_choice)
      puts "Computer won!"
      computer_wins += 1
      playmore = true
    end

    if players_wins == 2
      puts "Player wins double or nothing!"
    elsif computer_wins == 2
      repeat = false
      break
      puts "Computer wins double or nothing!"
      repeat = false
      break
    elsif computer_wins == 1 && players_wins == 1
      puts "Tied one to one! This is for all the marbles!!!"
      playmore = false
    end

    while playmore == true
      begin
      puts "Best out of three? (y/n)"
      double = gets.chomp.downcase
        if double == 'y'
          puts "Good luck. Computer is pretty smart."
        elsif double == 'n'
          puts "Thanks for playing!"
          repeat = false 
        else
          puts "Could you repeat that?"
        end
      playmore = false
      end while double != 'y' && double != 'n'  
    end
        
  end while repeat == true # current game loop

  puts "Would you like to play again? (y/n)"
end until gets.chomp == 'n' # overall game loop




