# frozen_string_literal: true

# Telescope help us to watch the universe and galaxies
class Telescope
  def self.watch(universe)
    universe.galaxies.each do |starships|
      puts starships.join(' ')
    end
  end
end
