class TwoSum
  def initialize(array, target)
    @array = array
    @target = target
  end

  def number_retriever
    hash = {}

    @array.each_with_index do |first_value, index|

      hash = Hash[@array.each_with_index.map { |value, i| [i, value] }]

      hash.each do |second_index, second_value|
        next if second_index == index

        if (first_value + second_value == @target)
          return [index, second_index]
        end
      end
    end

    return nil
  end
end

def print_output(pair_indices, target)
  if pair_indices
    puts "Indices of the two numbers that add up to #{target}: #{pair_indices}"
  else
    puts "No pair found in the array that adds up to #{target}"
  end
end

def test_cases
  num1 = [2,7,11,15]
  num2 = [1,0,8,15]
  num3 = [2,0]
  num4 = [2,2,2,2]
  num5 = [11,7,-2,15]
  target = 9

  t = TwoSum.new(num1, target)
  print_output(t.number_retriever, target)

  t = TwoSum.new(num2, target)
  print_output(t.number_retriever, target)

  t = TwoSum.new(num3, target)
  print_output(t.number_retriever, target)

  t = TwoSum.new(num4, target)
  print_output(t.number_retriever, target)

  t = TwoSum.new(num5, target)
  print_output(t.number_retriever, target)

end

test_cases


