require_relative "Board"

class Game
  attr_accessor :board, :generation, :total_generations

  def initialize(board=Board.new, seeds=[])
    @board = board
    @seeds = seeds
    @total_generations = 1
    @generation = 0

    if @seeds.length == 0
      @board.generate
    end

    @seeds.each do |row|
      @board.grid[row[0]][row[1]].state = true
    end
  end

  def nextGeneration
    cells_that_live = []
    cells_that_die  = []

    @board.cells.each do |cell|
      live_cells = @board.neighborsAlive(cell).count

      if cell.isAlive
        # cualquier celula viva con menos de 2 vecinos muere.
        cells_that_die << cell if live_cells < 2

        # cualquier celula viva con mas de 3 vecinos muere.
        cells_that_die << cell if live_cells > 3

        # cualquier celula viva con 2 o 3 vecinos vivos, continua viva para la proxima generacion.
        cells_that_live << cell if live_cells == 2 or live_cells == 3
      else
        # cualquier celula muerta con exactamente 3 vecinos vivos, nace para la proxima generacion.
        cells_that_live << cell if live_cells == 3
      end
    end

    cells_that_live.each  { |cell| cell.bornCell }
    cells_that_die.each   { |cell| cell.killCell }
  end

  def print
    puts "*** Generation #{@generation} ***"
    @board.grid.each do |row|
      puts row.join('');
    end
  end

  def run
    @total_generations.times do |i|
      self.print
      self.nextGeneration
      @generation += 1
    end
    @generation
  end
end

seed_blinker = [ [0,1], [1,1], [2,1] ]
seed_glider = [ [0,1], [1,2], [2,0], [2,1], [2,2] ]
b = Board.new(3,3)
g = Game.new(b,seed_blinker)
g.total_generations = 10
g.run
