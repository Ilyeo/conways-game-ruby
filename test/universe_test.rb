# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/universe'
require_relative '../lib/telescope'

describe Universe do
  it 'returns a matrix of galaxies' do
    u = Universe.new
    _(u.galaxies).must_be_instance_of Array
    _(u.galaxies.first).must_be_instance_of Array
    _(u.galaxies.first.first).must_be_instance_of Galaxy
  end

  it 'populates an universe with galaxies' do
    u = Universe.new
    _(u).must_respond_to :bing_bang
  end

  describe 'blinker pattern' do
    before do
      def inspect_neighborhood_sizes(u)
        u.galaxies.each do |starship|
          starship.each do |galaxy|
            print galaxy.neighborhood_size
          end
          print "\n"
        end
      end

      blinker = []
      3.times { blinker << [Galaxy.new(0), Galaxy.new(1), Galaxy.new(0)] }

      @u = Universe.new(blinker)
    end

    it 'returns 1\'s (vertical blinker)' do
      _(@u.galaxies[0][1].state).must_equal 1
      _(@u.galaxies[1][1].state).must_equal 1
      _(@u.galaxies[2][1].state).must_equal 1
      puts 'Blinker pattern in the universe'
      Telescope.watch(@u)
    end

    it 'sets the neighbors size for each galaxy' do
      @u.explore_neighborhood
      blinker_neighborhood = @u.galaxies.map { |v| v.map(&:neighborhood_size) }.flatten
      _(blinker_neighborhood).must_equal [2, 1, 2, 3, 2, 3, 2, 1, 2]
      puts 'Blinker neighborhood sizes'
      inspect_neighborhood_sizes(@u)
    end

    it 'returns 1\'s (horizontal blinker)' do
      @u.explore_neighborhood
      @u.next_generation
      _(@u.galaxies[1][0].state).must_equal 1
      _(@u.galaxies[1][1].state).must_equal 1
      _(@u.galaxies[1][2].state).must_equal 1
      puts 'Blinker pattern next generation (iteration 2)'
      Telescope.watch(@u)
    end
  end
end
