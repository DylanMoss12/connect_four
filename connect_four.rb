class Game
  attr_accessor :column1, :column2, :column3, :column4
  def initialize
    print "Player 1 name: "
    @player1 = gets.chomp
    print "Player 2 name: "
    @player2 = gets.chomp
    @current_player = @player1

    @column1 = [' ', ' ', ' ', ' ', ' ', ' ']
    @column2 = [' ', ' ', ' ', ' ', ' ', ' ']
    @column3 = [' ', ' ', ' ', ' ', ' ', ' ']
    @column4 = [' ', ' ', ' ', ' ', ' ', ' ']
    @column5 = [' ', ' ', ' ', ' ', ' ', ' ']
    @column6 = [' ', ' ', ' ', ' ', ' ', ' ']
    @column7 = [' ', ' ', ' ', ' ', ' ', ' ']

    @column1_size = 0
    @column2_size = 0
    @column3_size = 0
    @column4_size = 0
    @column5_size = 0
    @column6_size = 0
    @column7_size = 0
  end

  def print_board
    print '|', @column1[5], '|', @column2[5], '|', @column3[5], '|', @column4[5], '|', @column5[5], '|', @column6[5], '|', @column7[5], '|', "\n"
    print '---------------', "\n"
    print '|', @column1[4], '|', @column2[4], '|', @column3[4], '|', @column4[4], '|', @column5[4], '|', @column6[4], '|', @column7[4], '|', "\n"
    print '---------------', "\n"
    print '|', @column1[3], '|', @column2[3], '|', @column3[3], '|', @column4[3], '|', @column5[3], '|', @column6[3], '|', @column7[3], '|', "\n"
    print '---------------', "\n"
    print '|', @column1[2], '|', @column2[2], '|', @column3[2], '|', @column4[2], '|', @column5[2], '|', @column6[2], '|', @column7[2], '|', "\n"
    print '---------------', "\n"
    print '|', @column1[1], '|', @column2[1], '|', @column3[1], '|', @column4[1], '|', @column5[1], '|', @column6[1], '|', @column7[1], '|', "\n"
    print '---------------', "\n"
    print '|', @column1[0], '|', @column2[0], '|', @column3[0], '|', @column4[0], '|', @column5[0], '|', @column6[0], '|', @column7[0], '|', "\n"
    print '---------------', "\n"
  end

  def win_check
    if win_check_horizontal || win_check_vertical || win_check_diagonal
      true
    else
      false
    end
  end

  def win_check_horizontal
    i = 0
    found = false
    until i == 6
      if @column1[i] != ' ' && @column1[i] == @column2[i] && @column1[i] == @column3[i] && @column1[i] == @column4[i]
        found = true
      elsif @column2[i] != ' ' && @column2[i] == @column3[i] && @column2[i] == @column4[i] && @column2[i] == @column5[i]
        found = true
      elsif @column3[i] != ' ' && @column3[i] == @column4[i] && @column3[i] == @column5[i] && @column3[i] == @column6[i]
        found = true
      elsif @column4[i] != ' ' && @column4[i] == @column5[i] && @column4[i] == @column6[i] && @column4[i] == @column7[i]
        found = true
      end
      i += 1
    end
    found
  end

  def win_check_vertical
    array_of_columns = [@column1, @column2, @column3, @column4, @column5, @column6, @column7]
    found = false
    array_of_columns.each do |x|
      if x[5] != ' ' && x[5] == x[4] && x[5] == x[3] && x[5] == x[2]
        found = true
      elsif x[4] != ' ' && x[4] == x[3] && x[4] == x[2] && x[4] == x[1]
        found = true
      elsif x[3] != ' ' && x[3] == x[2] && x[3] == x[1] && x[3] == x[0]
        found = true
      end
    end
    found
  end

  def win_check_diagonal
    if diagonal_right || diagonal_left
      true
    else
      false
    end
  end

  def diagonal_right
    i = 0
    found = false
    until i == 4
      if @column1[i] != ' ' && @column1[i] == @column2[i + 1] && @column1[i] == @column3[i + 2] && @column1[i] == @column4[i + 3]
        found = true
      elsif @column2[i] != ' ' && @column2[i] == @column3[i + 1] && @column2[i] == @column4[i + 2] && @column2[i] == @column5[i + 3]
        found = true
      elsif @column3[i] != ' ' && @column3[i] == @column4[i + 1] && @column3[i] == @column5[i + 2] && @column3[i] == @column6[i + 3]
        found = true
      elsif @column4[i] != ' ' && @column4[i] == @column5[i + 1] && @column4[i] == @column6[i + 2] && @column4[i] == @column7[i + 3]
        found = true
      end
      i += 1
    end
    found
  end

  def diagonal_left
    i = 0
    found = false
    until i == 4
      if @column7[i] != ' ' && @column7[i] == @column6[i + 1] && @column7[i] == @column5[i + 2] && @column7[i] == @column4[i + 3]
        found = true
      elsif @column6[i] != ' ' && @column6[i] == @column5[i + 1] && @column6[i] == @column4[i + 2] && @column6[i] == @column3[i + 3]
        found = true
      elsif @column5[i] != ' ' && @column5[i] == @column4[i + 1] && @column5[i] == @column3[i + 2] && @column5[i] == @column2[i + 3]
        found = true
      elsif @column4[i] != ' ' && @column4[i] == @column3[i + 1] && @column4[i] == @column2[i + 2] && @column4[i] == @column1[i + 3]
        found = true
      end
      i += 1
    end
    found
  end

  def make_move
    valid = false
    until valid
      print "Select a column (1 - 7) to put your piece: "
      input = gets.chomp
      if !('1'..'7').include?(input)
        puts "This is not a valid input"
      elsif filled?(input.to_i)
        puts "This column is filled, please select another"
      else
        fill_column(input.to_i)
        valid = true
      end
    end
  end

  def filled?(input)
    if input == 1
      if @column1[5] != ' '
        true
      else
        false
      end
    elsif input == 2
      if @column2[5] != ' '
        true
      else
        false
      end
    elsif input == 3
      if @column3[5] != ' '
        true
      else
        false
      end
    elsif input == 4
      if @column4[5] != ' '
        true
      else
        false
      end
    elsif input == 5
      if @column5[5] != ' '
        true
      else
        false
      end
    elsif input == 6
      if @column6[5] != ' '
        true
      else
        false
      end
    else
      if @column7[5] != ' '
        true
      else
        false
      end
    end
  end

  def fill_column(input)
    if input == 1
      if @current_player == @player1
        @column1[@column1_size] = 'R'
      else
        @column1[@column1_size] = 'Y'
      end
      @column1_size += 1
    elsif input == 2
      if @current_player == @player1
        @column2[@column2_size] = 'R'
      else
        @column2[@column2_size] = 'Y'
      end
      @column2_size += 1
    elsif input == 3
      if @current_player == @player1
        @column3[@column3_size] = 'R'
      else
        @column3[@column3_size] = 'Y'
      end
      @column3_size += 1
    elsif input == 4
      if @current_player == @player1
        @column4[@column4_size] = 'R'
      else
        @column4[@column4_size] = 'Y'
      end
      @column4_size += 1
    elsif input == 5
      if @current_player == @player1
        @column5[@column5_size] = 'R'
      else
        @column5[@column5_size] = 'Y'
      end
      @column5_size += 1
    elsif input == 6
      if @current_player == @player1
        @column6[@column6_size] = 'R'
      else
        @column6[@column6_size] = 'Y'
      end
      @column6_size += 1
    else
      if @current_player == @player1
        @column7[@column7_size] = 'R'
      else
        @column7[@column7_size] = 'Y'
      end
      @column7_size += 1
    end
  end

  def change_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def play
    plays = 0
    win = false
    until win == true || plays == 42
      print_board
      make_move
      if win_check
        win = true
      end
      plays += 1
      change_player
    end
    print_board
    if win == true
      change_player
      puts "Congrats #{@current_player}, you won!"
    else
      puts "It was a draw!"
    end
  end
end

game = Game.new
game.play