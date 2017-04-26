print "Hola Ruby!"

class Board
  attr_accessor :columns, :rows, :cells, :grid

  # constructor
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

  # recolecta las celulas vivas y las almacena en @cells { Array }
  def live_cells
    live_cells = []
    @cells.each{ |cell| live_cells << cell if cell.isAlive }
    live_cells
  end

  # recolecta las celulas muertas y las almacena en @cells { Array }
  def dead_cells
    dead_cells = []
    @cells.each{ |cell| dead_cells << cell if cell.isDead }
    dead_cells
  end

  # recolecta los vecinos vivos
  def neighborsAlive(cell)
    live_cells = []
    # arriba
    live_cells << @grid[cell.y - 1][cell.x] if @grid[cell.y - 1][cell.x].isAlive and cell.y > 0
    # abajo
    live_cells << @grid[cell.y + 1][cell.x] if @grid[cell.y + 1][cell.x].isAlive and cell.y < (rows - 1)
    # izquierda
    live_cells << @grid[cell.y][cell.x - 1] if @grid[cell.y][cell.x - 1].isAlive and cell.x > 0
    # derecha
    live_cells << @grid[cell.y][cell.x + 1] if @grid[cell.y][cell.x + 1].isAlive and cell.x < (columns - 1)
    # arriba izquierda
    live_cells << @grid[cell.y - 1][cell.x - 1] if @grid[cell.y - 1][cell.x - 1].isAlive and cell.y > 0 and cell.x > 0
    # arriba derecha
    live_cells << @grid[cell.y - 1][cell.x + 1] if @grid[cell.y - 1][cell.x + 1].isAlive and cell.y > 0 and cell.x < (columns - 1)
    # abajo izquierda
    live_cells << @grid[cell.y + 1][cell.x - 1] if @grid[cell.y + 1][cell.x - 1].isAlive and cell.y < (rows - 1) and cell.x > 0
    # abajo derecha
    live_cells << @grid[cell.y + 1][cell.x + 1] if @grid[cell.y + 1][cell.x + 1].isAlive and cell.y < (rows - 1) and cell.x < (rows - 1)
    live_cells
  end

  # crea una generacion inicial
  def generate
    @grid.each do |row|
      row.each do |cell|
        cell.state = [true, false].sample
      end
    end
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
