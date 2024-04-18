require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :players, :current_player, :status, :board

  def initialize(players, board)
    @players = players
    @current_player = @players.first
    @status = 'en cours'
    @board = Board.new
  end

  def start
    while @status == 'en cours'
      tour
    end
    end_game
  end

  def ask_choice
    print "Choisissez une case (ou tapez 'exit' pour quitter) : "
    gets.chomp.upcase
  end

  def tour
    puts "C'est à #{current_player.name} de jouer !"
    @board.display
    choice = ask_choice
    return if choice == "exit" 
    @board.play(choice, current_player)
    if @board.victory?
      @status = 'victory'
    elsif @board.draw?
      @status = 'draw'
    else
      switch_player
    end
  end

  def switch_player
    @current_player = (@current_player == @players.first) ? @players.last : @players.first
  end

  def end_game
    case @status
    when 'victory'
      puts "Félicitations #{current_player.name} ! Vous avez gagné."
    when 'draw'
      puts "Et c'est un match nul !"
    end
  end
end
