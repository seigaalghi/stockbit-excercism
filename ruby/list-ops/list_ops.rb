=begin
Write your code for the 'List Ops' exercise in this file. Make the tests in
`list_ops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/list-ops` directory.
=end

class ListOps
  class << self
    def arrays(list)
      list.size
    end
    def reverser(list)
      list.reverse
    end
    def concatter(a, b)
      a + b
    end
    def mapper(list, &block)
      list.map{ |x| yield(x) }
    end
    def filterer(list, &block)
      list.select{ |x| yield(x) }
    end
    def sum_reducer(list)
      list.reduce(0){ |acc, x| acc + x }
    end
    def factorial_reducer(list)
      list.reduce(1){ |acc, x| acc * x }
    end
  end
end