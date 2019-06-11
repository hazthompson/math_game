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
