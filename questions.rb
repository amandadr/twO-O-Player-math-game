require_relative 'game'

class Questions
  def initialize
    @current_player = nil
    @question_nums = nil
    @other_player = nil
  end

  def set_question_nums(current_player, input)
    @current_player = current_player
    @other_player = (@current_player.name == 'Player 1') ? 'Player 2' : 'Player 1'
    @question_nums = input.split.map(&:to_i)
    puts "#{@other_player}: What is the sum of #{@question_nums[0]} and #{@question_nums[1]}?"
  end

  def test_correct(answer)
    correct = (@question_nums.sum == answer.to_i)
    @current_player.wins += 1 if correct
    @current_player.lives -= 1 unless correct
    puts correct ? "#{@other_player}: YES! Correct!" : "#{@other_player}: Incorrect! #{@current_player.name} lost a life!"
  end
end