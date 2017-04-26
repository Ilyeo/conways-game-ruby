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
