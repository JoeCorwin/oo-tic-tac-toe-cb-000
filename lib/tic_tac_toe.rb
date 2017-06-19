class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  @board
  end



  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end


  def valid_move?(index)
    if index.between?(0, 8) == true && position_taken?(index) == false
      true
    end
  end
  #
  #
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    until valid_move?(index) == true
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end
    move(index, token = current_player)
    display_board
  end


  def won?
    WIN_COMBINATIONS.each do |winindex|
      if @board[winindex[0]] == "X" && @board[winindex[1]] == "X" && @board[winindex[2]] == "X"
        return winindex
      elsif @board[winindex[0]] == "O" && @board[winindex[1]] == "O" && @board[winindex[2]] == "O"
        return winindex
      end
    end
    return false
  end



  def full?
     @board.none? { |e| e == " " }
  end



  def draw?
    if won? == false && full? == true
      true
    end
  end



  def over?
    if won? == true || draw? == true || full? == true
      true
    end
  end



  def winner
    winindex = won?
    if winindex == false
      return nil
    elsif @board[winindex[0]] == "X"
      return "X"
    elsif @board[winindex[0]] == "O"
      return "O"
    end
  end

  def play
    until over? == true || won? != false
      turn
    end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      elsif draw? == true
        puts "Cat's Game!"
      end
  end

end
