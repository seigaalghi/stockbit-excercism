class Change
  ImpossibleCombinationError = NegativeTargetError = Class.new(RuntimeError)
  def self.generate(coins, target)
    raise NegativeTargetError if target < 0
    return [] if target == 0
    for i in 1..target do
      coins.repeated_combination(i).each{ |changes| return changes if changes.sum == target }
    end
    raise ImpossibleCombinationError
  end
end