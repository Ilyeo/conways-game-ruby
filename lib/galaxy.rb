# frozen_string_literal: true

# Galaxy exists in the universe or don't
class Galaxy
  attr_reader :state, :neighborhood_size

  def initialize(state = 0)
    @state = state
    @neighborhood_size = 0
  end

  def destroy
    destroy!
  end

  def destroy!
    @state = 0
  end

  def spawn
    spawn!
  end

  def spawn!
    @state = 1
  end

  def alive?
    @state == 1
  end

  def to_s
    @state == 1 ? '⬜️' : '⬛️'
  end

  def neighborhood(neighbors)
    @neighborhood_size = neighbors
  end

  def underpopulation?
    @neighborhood_size < 2
  end

  def overpopulation?
    @neighborhood_size > 3
  end

  def next_generation?
    @neighborhood_size == 2
  end

  def reproduction?
    @neighborhood_size == 3
  end
end
