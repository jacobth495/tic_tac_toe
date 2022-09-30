# frozen_string_literal: true

module GameBoard
  attr_accessor :player, :location

  @@top_array =  [nil, nil, nil]
  @@middle_array = [nil, nil, nil]
  @@bottom_array = [nil, nil, nil]

  def show_board
    puts ''
    puts 'Current Game Board'
    print @@top_array
    puts ''
    puts '---------------'
    print @@middle_array
    puts ''
    puts '---------------'
    print @@bottom_array
    puts ''
    puts ''
  end

  def play_round(input)
    puts 'Location Key'
    puts 't1 t2 t3'
    puts 'm1 m2 m3'
    puts 'b1 b2 b3'
    puts ''
    puts "#{@player}'s Turn"
    puts 'Choose Where To Play'
    $location = gets.chomp.downcase
    case $location
    when 't1'
      @@top_array[0] = input
    when 't2'
      @@top_array[1] = input
    when 't3'
      @@top_array[2] = input
    when 'm1'
      @@middle_array[0] = input
    when 'm2'
      @@middle_array[1] = input
    when 'm3'
      @@middle_array[2] = input
    when 'b1'
      @@bottom_array[0] = input
    when 'b2'
      @@bottom_array[1] = input
    when 'b3'
      @@bottom_array[2] = input
    else
      puts 'Please choose t1, t2, t3, m1, m2, m3, b1, b2, b3'
    end
    show_board
  end

  def winner?
    # horizontal 3 in a rows
    if @@top_array[0] == 'x' && @@top_array[1] == 'x' && @@top_array[2] == 'x'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@top_array[0] == 'o' && @@top_array[1] == 'o' && @@top_array[2] == 'o'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@middle_array[0] == 'o' && @@middle_array[1] == 'o' && @@middle_array[2] == 'o'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@middle_array[0] == 'x' && @@middle_array[1] == 'x' && @@middle_array[2] == 'x'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@bottom_array[0] == 'x' && @@bottom_array[1] == 'x' && @@bottom_array[2] == 'x'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@bottom_array[0] == 'o' && @@bottom_array[1] == 'o' && @@bottom_array[2] == 'o'
      puts "Congrats #{@player} is the winner!!!"
      true
    # vertical 3 in a rows
    elsif @@bottom_array[0] == 'o' && @@middle_array[0] == 'o' && @@top_array[0] == 'o'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@bottom_array[0] == 'x' && @@middle_array[0] == 'x' && @@top_array[0] == 'x'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@bottom_array[1] == 'o' && @@middle_array[1] == 'o' && @@top_array[1] == 'o'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@bottom_array[1] == 'x' && @@middle_array[1] == 'x' && @@top_array[1] == 'x'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@bottom_array[2] == 'o' && @@middle_array[2] == 'o' && @@top_array[2] == 'o'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@bottom_array[2] == 'x' && @@middle_array[2] == 'x' && @@top_array[2] == 'x'
      puts "Congrats #{@player} is the winner!!!"
      true
    # diagnal 3 in a rows
    elsif @@bottom_array[0] == 'x' && @@middle_array[1] == 'x' && @@top_array[2] == 'x'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@bottom_array[0] == 'o' && @@middle_array[1] == 'o' && @@top_array[2] == 'o'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@bottom_array[2] == 'x' && @@middle_array[1] == 'x' && @@top_array[0] == 'x'
      puts "Congrats #{@player} is the winner!!!"
      true
    elsif @@bottom_array[2] == 'o' && @@middle_array[1] == 'o' && @@top_array[0] == 'o'
      puts "Congrats #{@player} is the winner!!!"
      true
    #In case of tie
    elsif @@bottom_array.any?(nil) == false && @@middle_array.any?(nil) == false  && @@top_array.any?(nil) == false
      puts 'The sad yet normal life of a tie in Tic-Tac-Toe'
      true 
    else
      false
    end
  end
end

class Player
  include GameBoard
  def initialize
    puts 'Please enter your name'
    @player = gets.chomp
    puts "Welcome #{@player}"
    puts ''
  end
end

playerone = Player.new
playertwo = Player.new
players = playerone || playertwo
playerone.show_board

include GameBoard
until players.winner? == true
  p1_chances = 3
  p2_chances = 3
  while p1_chances > 0
    playerone.play_round('x')
    if  ['t1', 't2', 't3', 'm1', 'm2', 'm3', 'b1', 'b2', 'b3'].any?($location) != true
      p1_chances -= 1
      puts "Invailed Choice"
      puts "#{p1_chances} Chances Left"
      puts 'Please Choose t1, t2, t3, m1, m2, m3, b1, b2, b3'
    else 
      p1_chances = 0
    end
  end
  break if players.winner? == true

  while p2_chances > 0
    playertwo.play_round('o')
    if  ['t1', 't2', 't3', 'm1', 'm2', 'm3', 'b1', 'b2', 'b3'].any?($location) != true
      p2_chances -= 1
      puts "Invailed Choice"
      puts "#{p2_chances} Chances Left"
      puts 'Please Choose t1, t2, t3, m1, m2, m3, b1, b2, b3'
    else
      p2_chances = 0
    end
  end
end
