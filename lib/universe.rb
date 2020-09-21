require_relative 'god'
require_relative 'galaxy'

class Universe
  attr_reader :galaxies

  def initialize(size = 45, galaxies = nil)
    @galaxies = galaxies || bing_bang!(size)
    @universe_threshold = size
  end

  def bing_bang!(size)
    Array.new(size) { Array.new(size) { Galaxy.new rand(2) } }
  end

  def watch
    @galaxies.each do |starship|
      starship.each do |galaxy|
        print galaxy.to_s
      end
      print "\n"
    end
  end

  def next_generation
    @galaxies.each do |vector|
      vector.each do |galaxy|
        God.destiny!(galaxy)
      end
    end
  end

  def explore_neighborhood
    @galaxies.each.with_index do |vector, y|
      vector.each.with_index do |galaxy, x|
        neighborhood = []
        # base compass rose
        north = y - 1
        east = x + 1
        south = y + 1
        west = x - 1
        #   NW  N  NE
        #    W  *  E    compass rose of * "the neighborhood"
        #   SW  S  SE
        neighborhood << @galaxies[north][x] if y > 0  # galaxy_at_north
        neighborhood << @galaxies[north][east] if y > 0 && x < (@galaxies.size - 1) # galaxy_at_north_east
        neighborhood << @galaxies[y][east] if x < (@galaxies.size - 1) # galaxy_at_east
        neighborhood << @galaxies[south][east] if y < (@galaxies.size - 1) && x < (@galaxies.size - 1) # galaxy_at_south_east
        neighborhood << @galaxies[south][x] if  y < (@galaxies.size - 1) # galaxy_at_south
        neighborhood << @galaxies[south][west] if  y < (@galaxies.size - 1) && x > 0 # galaxy_at_south_west
        neighborhood << @galaxies[y][west] if  x > 0 # galaxy_at_west
        neighborhood << @galaxies[north][west] if y > 0 && x > 0 # galaxy_at_north_west
        galaxy.neighborhood_size = neighborhood.select { |g| g.state == 1 }.size
      end
    end
  end
end
