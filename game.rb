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
