class Player
  attr_accessor :name, :lives, :wins

  def initialize(name)
    @name = name
    @lives = 3
    @wins = 0
  end
end