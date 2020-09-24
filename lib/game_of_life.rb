# frozen_string_literal: true

require_relative 'universe'
require_relative 'telescope'

blinker = []
3.times { blinker << [Galaxy.new(0), Galaxy.new(1), Galaxy.new(0)] }

u = Universe.new(blinker)

loop do
  Telescope.watch(u)
  u.explore_neighborhood
  u.next_generation
  sleep(0.25)
  system('clear')
end
