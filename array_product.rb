class ArrayProduct
  MAX_VALUE = 2**31 - 1
  MIN_VALUE = -2**31

  def initialize(array)
    raise ArgumentError, "Array length must be between 2 and 10^5" unless array.length.between?(2, 10**5)
    raise ArgumentError, "Array elements must be between -30 and 30" unless array.all? { |value| value.between?(-30, 30) }
    @array = array
  end

  def calculate_product
    left_side = Array.new(@array.size, 1)
    right_side = Array.new(@array.size, 1)

    (1...@array.size).each do |i|
      left_side[i] = check_integer(left_side[i - 1] * @array[i - 1])
    end

    (@array.size - 2).downto(0).each do |i|
      right_side[i] = check_integer(right_side[i + 1] * @array[i + 1])
    end

    final_array = []

    (0...@array.size).each do |i|
      final_array[i] = left_side[i] * right_side[i]
    end

    final_array
  end

  def check_integer(calculated_product)
    if calculated_product > MAX_VALUE || calculated_product < MIN_VALUE
      puts "Product exceeds integer limit"
      return nil
    end
    calculated_product
  end
end

def print_output(initial_array, product_array)
  puts "Original array: #{initial_array} - Product array: #{product_array}"
end

def test_cases
  num1 = [1,2,3,4]
  num2 = [1,0,8,15]
  num3 = [2,0]
  num4 = [2,2,2,2]
  num5 = [-1,1,0,-3,3]

  t = ArrayProduct.new(num1)
  print_output(num1, t.calculate_product())

  t = ArrayProduct.new(num2)
  print_output(num2, t.calculate_product())

  t = ArrayProduct.new(num3)
  print_output(num3, t.calculate_product())

  t = ArrayProduct.new(num4)
  print_output(num4, t.calculate_product())

  t = ArrayProduct.new(num5)
  print_output(num5, t.calculate_product())
end

test_cases
