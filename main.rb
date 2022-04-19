WIN = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

class Player
  attr_reader :name, :marker

  @@instances = 0

  def initialize(name, marker, id)
    @name = name
    @marker = marker
    @id = id
    @@instances += 1
  end

  def self.count
    @@instances
  end

  def who
    "Player #{@name} with marker #{@marker}"
  end
end

def player_names
  until Player.count == 2
    puts "Player #{Player.count + 1}, enter your name:"
    name = gets.chomp
    if Player.count.zero?
      player1 = Player.new(name, 'X', Player.count + 1)
    else
      player2 = Player.new(name, 'O', Player.count + 1)
    end
  end
  [player1, player2]
end

player1, player2 = player_names
@players = [player1, player2]

@current_player_indice = 1
def current_player
  @players[@current_player_indice]
end

def next_player
  @current_player_indice = (@current_player_indice + 1) % @players.size
end

@board = Array.new(9)
num = 1
@board = @board.each_index do |ind|
  @board[ind] = num
  num += 1
end
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def pick_spot
  puts "#{current_player.name}, choose one of available spots!"
  spot = gets.chomp.to_i
  @board[spot - 1] = current_player.marker
  next_player
end

display_board(@board)
pick_spot
display_board(@board)
pick_spot
display_board(@board)
pick_spot
display_board(@board)
pick_spot
display_board(@board)
