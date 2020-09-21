class Galaxy
  attr_reader :state
  attr_accessor :neighborhood_size

  def initialize(state = 0)
    @state = state
    @neighborhood_size = 0
  end

  def destroy!
    @state = 0
  end

  def spawn!
    @state = 1
  end

  def alive?
    @state == 1 ? true : false
  end

  def to_s
    @state == 1 ? '⬜️' : '⬛️'
  end
end
