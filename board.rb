require_relative 'boardcase'
require_relative 'game'

class Board
  attr_accessor :cases, :count_tour

  def initialize
    @cases = {}
    ('A'..'C').each do |letter|
      (1..3).each do |number|
        position = "#{letter}#{number}"
        @cases[position] = Boardcase.new(position)
      end
    end
    @count_tour = 0
  end

  def play(position, current_player)
    if position.nil? || position.length != 2
      puts "Position invalide ! Veuillez entrer une position valide."
      return
    end

    letter = position[0].upcase
    number = position[1]
  
    if ('A'..'C').include?(letter) && ('1'..'3').include?(number)
      if @cases.key?(position)
        if @cases[position].content == " "
          @cases[position].content = current_player.symbol
          @count_tour += 1
        else
          puts "Case déjà occupée !"
          return
        end
      else
        puts "Case invalide !"
        return
      end
    else
      puts "Position invalide ! Utilisez des lettres de A à C suivies de chiffres de 1 à 3."
      return
    end
  end

  def display
    puts "   1  2  3 "
    ('A'..'C').each do |letter|
      print "#{letter} "
      (1..3).each do |number|
        position = "#{letter}#{number}"
        print "[#{@cases[position]&.content || ' '}]"
      end
      puts ""
    end
  end

  def victory?
    winning_combinations.any? do |combination|
      positions = combination.map { |position| @cases[position]&.content }
      positions.uniq.length == 1 && positions[0] != " " && positions[0] != nil
    end
  end

  def draw?
    @count_tour == 9
  end

  private

  def winning_combinations
    [
      ["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"],
      ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"],
      ["A1", "B2", "C3"], ["A3", "B2", "C1"]
    ]
  end
end
