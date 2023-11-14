require_relative 'game'

# Main game loop
game = Game.new

puts "----START GAME----"
loop do
  game.play_round
end