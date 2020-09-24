# frozen_string_literal: true

# Galaxy exists in the universe or don't
class Galaxy
  attr_reader :state, :neighborhood_size

  def initialize(state = 0)
    @state = state
    @neighborhood_size = 0
  end

  def set_neighborhood_size(size)
    @neighborhood_size = size
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
end
