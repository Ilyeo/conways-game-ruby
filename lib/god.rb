# frozen_string_literal: true

# God applies conways rules
class God
  def self.destiny!(galaxy)
    if galaxy.alive?
      galaxy.destroy! if galaxy.underpopulation? || galaxy.overpopulation?
      galaxy.spawn! if galaxy.next_generation? || galaxy.reproduction?
    else
      galaxy.spawn! if galaxy.reproduction?
    end
  end
end
