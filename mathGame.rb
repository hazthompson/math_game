class Player 
  attr_accessor :name, :lives
  
  def initialize name
    @name = name
    @lives = 3
  end
end

class Question 
  def initialize 
    @number1 = Random.rand(20)
    @number2 = Random.rand(20)
  end

  def ask_question(player)
    print "#{player.name}: What does #{@number1} plus #{@number2} equal? "
  end

  def answer!(player, answer)
    if (answer.to_i == (@number1 + @number2)) 
      puts "Well done! That's correct"
    else 
      puts "Nope! incorrect" 
      player.lives -= 1
    end  
  end
end

class Game
  def initialize
    @player1 = Player.new "player1"
    @player2 = Player.new "player2"
    @current_player = @player1
    @current_question = Question.new
  end

  def finished?
    @player1.lives < 1 || @player2.lives < 1
  end

  def print_score
    puts "P1:#{@player1.lives}/3 vs P2:#{@player2.lives}/3"
  end

  def print_question
    @current_question.ask_question(@current_player)
  end

  def answer_question(answer)
    @current_question.answer!(@current_player, answer)
  end

  def next_question!
    @current_question = Question.new
  end

  def next_player!
    if (@current_player == @player1)
      @current_player = @player2
    else 
      @current_player = @player1  
    end  
  end

  def winner
    if @player1.lives > @player2.lives
      @player1
    else
      @player2
    end
  end
end

# puts '---GAME OVER---'

# player1 = Player.new "player1"
# player2 = Player.new "player2"

# puts player1.name
# puts player2.lives

# question1 = Question.new
# question1.ask_question(player1)

# turn 0 call player 1 - turn 1 then call player 1

game1 = Game.new

until game1.finished?
  game1.print_question
  answer = gets.chomp
  game1.answer_question(answer)
  game1.print_score
  if game1.finished?
    puts "#{game1.winner.name} wins with a score of #{game1.winner.lives}/3"
    puts "---GAME OVER---"
    puts "Goodbye"
  else
    puts"---NEW TURN ---" 
    game1.next_question!
    game1.next_player!
  end   
end
