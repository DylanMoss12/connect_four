require './connect_four'

describe Game do
  describe "#win_check_horizontal" do
    it "checks if there is a win (horizontally)" do
      game = Game.new
      game.column1 = [' ', ' ', ' ', ' ', ' ', 'X']
      game.column2 = [' ', ' ', ' ', ' ', ' ', 'X']
      game.column3 = [' ', ' ', ' ', ' ', ' ', 'X']
      game.column4 = [' ', ' ', ' ', ' ', ' ', 'X']
      expect(game.win_check_horizontal).to eql(true)
    end
  end

  describe "#win_check_vertical" do
    it "checks if there is a win (vertically)" do
      game = Game.new
      game.column1 = ['X', 'X', 'X', 'X', ' ', ' ']
      expect(game.win_check_vertical).to eql(true)
    end
  end

  describe "#win_check_diagonal" do
    it "checks if there is a win (diagonally)" do
      game = Game.new
      game.column1 = ['X', ' ', ' ', ' ', ' ', ' ']
      game.column2 = [' ', 'X', ' ', ' ', ' ', ' ']
      game.column3 = [' ', ' ', 'X', ' ', ' ', ' ']
      game.column4 = [' ', ' ', ' ', 'X', ' ', ' ']
      expect(game.win_check_diagonal).to eql(true)
      game.column1 = [' ', ' ', ' ', ' ', ' ', 'X']
      game.column2 = [' ', ' ', ' ', ' ', 'X', ' ']
      game.column3 = [' ', ' ', ' ', 'X', ' ', ' ']
      game.column4 = [' ', ' ', 'X', ' ', ' ', ' ']
      expect(game.win_check_diagonal).to eql(true)
    end
  end

  describe "#filled?" do
    it "checks whether a column is filled" do
      game = Game.new
      game.column2 = ['X', 'X', 'X', 'X', 'X', 'X']
      expect(game.filled?(2)).to eql(true)
    end
  end

  describe "#fill_column" do
    it "fills the specified column" do
      game = Game.new
      game.column1 = ['R', 'R', ' ', ' ', ' ', ' ']
      game.fill_column(1)
      expect(game.column1).to eql(['R', 'R', 'R', ' ', ' ', ' '])
    end
  end
end