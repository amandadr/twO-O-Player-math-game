require_relative 'questions'
require_relative 'player'

class Game
  def initialize
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @current_player = @player_1
    @questions = Questions.new
  end

  def switch_players
    @current_player = (@current_player == @player_1) ? @player_2 : @player_1
    puts "----NEW TURN----"
  end

  def update_winner
    if @player_1.lives == 0 || @player_2.lives == 0
      winner = (@player_1.lives == 0) ? @player_2 : @player_1
      puts "----GAME OVER----"
      puts "#{winner.name} is the winner with #{winner.lives}/3 lives and #{winner.wins} wins!"
      exit
    end
  end

  def update_game_data
    puts "P1: #{player_1.lives}/3 vs P2: #{player_2.lives}/3"
  end

  def play_round
    @questions.set_question_nums(@current_player, gets.chomp)
    @questions.test_correct(gets.chomp)
    update_winner
    update_game_data
    switch_players if @current_player.lives > 0
  end

  private

  attr_reader :player_1, :player_2
end