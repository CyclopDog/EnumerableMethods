module Enumerable

    def my_each
        index = 0
        while index < self.length
            yield(self[index])
            index += 1
        end
    end

    def my_select
        selection = []
        self.my_each do |x|
            if yield(x)
                selection << x
            end
        end 
    selection
    end

    def my_all?
        self.my_each do |x|
          if yield(x) == false
            return false
          end
        end
    return true
    end

    def my_none?
        self.my_each do |x|
            if yield(x) == true
            return false
            end
        end
    return true
    end

    def my_any?
        self.my_each do |x|
            if yield(x) == true
            return true
            end
        end
    return false
    end

    def my_count
        return self.length
    end

    def my_map
        index = 0
        while index < self.length
            self[index] = yield
            index += 1
        end
    end

end

# ----------- TESTS ----------- #

# my each
puts "my each"
[1, 2, 3, 4].my_each do |x|
    puts x
end
puts "---------"

#my select
puts "my select"
pets = [{name: "Butters", age: 3, type: "dog"}, {name: "Lizzy", age: 6, type: "dog"}, {name: "Red", age: 1, type: "cat"}, {name: "Joey", age: 3, type: "dog"}]
puts pets.my_select { |item| item[:type] == "dog" }
puts "---------"

#my all
puts "my_all?"
puts [1, 1, 1, 1].my_all? { |x| x == 1 }
puts [1, 1, 2, 1].my_all? { |x| x == 1 }
puts "---------"

#my none
puts "my_none?"
puts [1, 1, 1, 1].my_none? { |x| x == 1 }
puts [2, 2, 2, 2].my_none? { |x| x == 1 }
puts "---------"

#my any
puts "my_any?"
puts [0, 1, 0, 0].my_any? { |x| x == 1 }
puts [2, 2, 2, 2].my_any? { |x| x == 1 }
puts "---------"

#my count
puts "my_count"
puts [1, 1, 1, 1].my_count
puts "---------"

#my map
puts "my_map"
puts [1, 1, 1, 1].my_map { |x| x*2 }
puts "---------"