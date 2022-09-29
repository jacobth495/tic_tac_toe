module GameBoard
  top_array =  [nil, nil, nil]
  middle_array = [nil, nil, nil]
  bottom_array = [nil, nil, nil]
  board = (print top_array
    puts ''
    puts '  -----------'
    print middle_array
    puts ''
    puts '  -----------'
    print bottom_array
    puts '')
end

class Player
  include GameBoard
  def initialize
    puts 'Please enter your name'
    @player = gets.chomp
    puts "Welcome #{@player}"
  end
end

playerone = Player.new
playertwo = Player.new

playerone.board