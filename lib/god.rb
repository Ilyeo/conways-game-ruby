# frozen_string_literal: true

# God applies conways rules
class God
  def self.destiny!(galaxy)
    if galaxy.alive?
      if galaxy.neighborhood_size < 2 || galaxy.neighborhood_size > 3
        galaxy.destroy!
      elsif galaxy.neighborhood_size == 2 || galaxy.neighborhood_size == 3
        galaxy.spawn!
      end
    else
      galaxy.spawn! if galaxy.neighborhood_size == 3
    end
  end
end
