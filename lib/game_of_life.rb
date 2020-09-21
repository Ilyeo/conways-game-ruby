require_relative 'universe'

blinker = [
  [ Galaxy.new(0), Galaxy.new(1), Galaxy.new(0) ],
  [ Galaxy.new(0), Galaxy.new(1), Galaxy.new(0) ],
  [ Galaxy.new(0), Galaxy.new(1), Galaxy.new(0) ]
]

u = Universe.new(blinker)

loop do
  u.watch
  u.explore_neighborhood
  u.next_generation
  sleep(0.25)
  system('clear')
end
