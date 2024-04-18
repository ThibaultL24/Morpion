require_relative 'player'
require_relative 'game'
require_relative 'board'
require_relative 'show'

puts "------------------------------------------------"
puts "| Bienvenue sur 'Morpion Thib's Tournament ' ! |"
puts "| Le but du jeu est ... bah de gagner !        |"
puts "-------------------------------------------------"

puts "Bienvenue à vous, héros... Toi!!, quel est ton nom ?"
print "> "
player1_name = gets.chomp

puts "Et toi, quel est ton nom ?"
print ">"
player2_name = gets.chomp

player1 = Player.new(player1_name, "X")
player2 = Player.new(player2_name, "O")

players = [player1, player2]

puts "#{player1.name} joue avec le symbole #{player1.symbol}"
puts "#{player2.name} joue avec le symbole #{player2.symbol}"

board = initialize_board

game = Game.new(players, board)

game.start

game.board.display