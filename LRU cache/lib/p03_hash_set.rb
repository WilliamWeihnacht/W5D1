require "byebug"
class HashSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    #debugger
    if !(include?(key))
      self[key] << key.hash
      @count += 1
      resize! if @count > num_buckets
      return true
    else
      return false
    end
  end

  def include?(key)
    self[key].include?(key.hash)
  end

  def remove(key)
    if self[key].delete(key.hash)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
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
end
