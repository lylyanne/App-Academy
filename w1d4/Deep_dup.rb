class Array
  def deep_dup
    return [] if self.empty?
    new_array = []

    self.each do |el|
      unless el.is_a? Array
        new_array << el
      else
        new_array << el.deep_dup
      end
    end

    new_array
  end
end

array1 = [1, [2], [3, [4]]]

duplication = array1.deep_dup


p array1

p duplication

duplication << 5

p array1
p duplication
