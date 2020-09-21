class God
  def self.destiny!(galaxy)
    if galaxy.alive?
      if galaxy.neighborhood_size < 2 || galaxy.neighborhood_size > 3
        galaxy.destroy!
      elsif galaxy.neighborhood_size == 2 || galaxy.neighborhood_size == 3
        galaxy.spawn!
      end
    else
      if galaxy.neighborhood_size == 3
        galaxy.spawn!
      end
    end
  end
end
