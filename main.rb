require './player'
require './game'
require './question'



game1 = Game.new

until game1.finished?
  game1.print_question
  answer = gets.chomp
  game1.answer_question(answer)
  if game1.finished?
    puts "#{game1.winner.name} wins with a score of #{game1.winner.lives}/3"
    puts "---GAME OVER---"
    puts "Goodbye"
  else
    game1.print_score
    puts"---NEW TURN ---" 
    game1.next_question!
    game1.next_player!
  end   
end
