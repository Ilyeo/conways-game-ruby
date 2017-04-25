print "Hola Ruby!"

class Board
  attr_accessor :columns, :rows, :cells, :grid

  def initialize(columns=3, rows=3)
    @columns = columns
    @rows = rows
    @cells = []

    @grid = Array.new(rows){ |row| Array.new(columns){ |column| Cell.new(column, row) } }

    @grid.each do |row|
      row.each do |column|
        @cells << column if column.is_a? Cell
      end
    end
  end

  def live_cells
    live_cells = []
    @cells.each{ |cell| live_cells << cell if cell.isAlive }
    live_cells
  end

  def dead_cells
    dead_cells = []
    @cells.each{ |cell| dead_cells << cell if cell.isDead }
    dead_cells
  end
end

class Cell
  # nos ayuda a leer y escribir a los atributos.
  attr_accessor :x, :y, :state

  # constructor
  def initialize(x=0, y=0, state=false)
    # atributos
    @x = x
    @y = y
    @state = state
  end

  def isAlive
    state
  end

  def isDead
    !state
  end

  # mata una celula
  def killCell
    @state = false;
  end

  # nace una celula
  def bornCell
    @state = true;
  end

end
