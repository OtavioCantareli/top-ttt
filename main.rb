WIN = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

class Player
  attr_reader :name, :marker

  @@instances = 0

  def initialize(name, marker)
    @name = name
    @marker = marker
    @@instances += 1
  end

  def self.instances
    @@instances
  end

  def who
    "Player #{@name} with marker #{@marker}"
  end
end
