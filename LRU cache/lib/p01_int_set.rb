require "byebug"

class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true
    return true
  end

  def remove(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private
  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !(include?(num))
      self[num] << num
      return true
    end
    false
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    if !(include?(num))
      self[num] << num
      @count += 1
      resize! if @count > num_buckets
      return true
    else
      return false
    end
    
  
  end

  def remove(num)
    if self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    
    store1 = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    store1.each do |num1|
      num1.each do |ele|
        insert(ele)
      end
    end
    @store
  end

  def inspect
    print @store
  end

end
