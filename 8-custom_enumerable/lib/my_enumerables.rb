module Enumerable
  # Your code goes here
  def my_each
    return to_enum(:my_each) unless block_given?
    for elem in self
      yield elem
    end
      self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    i = 0
    self.my_each do |el|
      yield el, i
      i+=1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    res = []
    self.my_each do |el|
      res << el if yield el
    end
    res
  end

  def my_all?
    return to_enum(:my_all) unless block_given?
    self.my_each do |el|
      return false unless yield el
    end
    return true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?
    self.my_each do |el|
      return true if yield el
    end
    return false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    self.my_all? do |el|
        return false if yield el
    end
      return true
  end

  def my_count
    return p self.size unless block_given?
    res = []
    self.my_each do |el|
      res << el if yield el
    end
      res.size
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    res = []
    self.my_each do |el|
      res << yield(el)
    end
    res
  end

  def my_inject(initial_value = self[0])
    return to_enum(:my_inject) unless block_given?
    self.my_each do |el|
        initial_value = yield el, initial_value
    end
    initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  include Enumerable
end

teste = [1, 1, 2, 3, 5, 8, 13, 21, 6, 101, 233]