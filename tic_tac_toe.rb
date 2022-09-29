module GameBoard
  @@top_array =  [nil, nil, nil]
  @@middle_array = [nil, nil, nil]
  @@bottom_array = [nil, nil, nil]
  def show_board
    print @@top_array
    puts ''
    puts '-------------'
    print @@middle_array
    puts ''
    puts '-------------'
    print @@bottom_array
    puts ''
  end
  def play_round(input)
    location = gets.chomp
    case location
    when "t1"
      @@top_array[0] = input
    else
      puts "dang it"
    end
  end
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

playerone.show_board

playerone.play_round("x")

playerone.show_board