require_relative 'board'
require_relative 'boardcase'

def initialize_board
     {
      'A, 1' => ' ', 'A, 2' => ' ', 'A, 3' => ' ',
      'B, 1' => ' ', 'B, 2' => ' ', 'B, 3' => ' ',
      'C, 1' => ' ', 'C, 2' => ' ', 'C, 3' => ' '
    }
  end
  
  def display
    puts "   1  2  3 "
    ('A'..'C').each do |letter|
      print "#{letter} "
      (1..3).each do |number|
        position = "#{letter}, #{number}"
        print "[#{@cases[position]}]" 
      end
      puts ""
    end
end