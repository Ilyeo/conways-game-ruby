# frozen_string_literal: true

require_relative 'god'
require_relative 'galaxy'

# Universe has galaxies to live in there
class Universe
  attr_reader :galaxies

  def initialize(size = 45)
    @galaxies = bing_bang(size)
  end

  def bing_bang(size)
    Array.new(size) { Array.new(size) { Galaxy.new rand(2) } }
  end

  def next_generation
    @galaxies.flatten.each { |galaxy| God.destiny!(galaxy) }
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
        neighborhood << @galaxies[north][x] if y.positive? # galaxy_at_north
        neighborhood << @galaxies[north][east] if y.positive? && x < (@galaxies.size - 1) # galaxy_at_north_east
        neighborhood << @galaxies[y][east] if x < (@galaxies.size - 1) # galaxy_at_east
        if y < (@galaxies.size - 1) && x < (@galaxies.size - 1)
          neighborhood << @galaxies[south][east] # galaxy_at_south_east
        end
        neighborhood << @galaxies[south][x] if y < (@galaxies.size - 1) # galaxy_at_south
        neighborhood << @galaxies[south][west] if  y < (@galaxies.size - 1) && x.positive? # galaxy_at_south_west
        neighborhood << @galaxies[y][west] if  x.positive? # galaxy_at_west
        neighborhood << @galaxies[north][west] if y.positive? && x.positive? # galaxy_at_north_west
        galaxy.neighborhood(neighborhood.select(&:alive?).size)
      end
    end
  end
end
