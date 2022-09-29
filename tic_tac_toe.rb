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
    puts "t1 t2 t3"
    puts "m1 m2 m3"
    puts "b1 b2 b3"
    puts "Choose Where To Play"
    location = gets.chomp
    case location
    when "t1"
      @@top_array[0] = input
    when "t2"
      @@top_array[1] = input
    when "t3"
      @@top_array[2] = input
    when "m1"
      @@middle_array[0] = input
    when "m2"
      @@middle_array[1] = input
    when "m3"
      @@middle_array[2] = input
    when "b1"
      @@bottom_array[0] = input
    when "b2"
      @@bottom_array[1] = input
    when "b3"
      @@bottom_array[2] = input
    else
      puts "Please choose t1, t2, t3, m1, m2, m3, b1, b2, b3"
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