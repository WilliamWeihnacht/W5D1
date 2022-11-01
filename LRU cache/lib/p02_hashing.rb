class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    arr = []
    self.each_with_index do |x,i|
      arr.push(x.hash*i)
    end
    return arr.sum
  end
end

class String
  def hash
    arr1 = []
    self.each_char.with_index do |x,i|
      arr1.push((x.ord)*i)
    end
    return arr1.hash
  end
    
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    ks = self.keys.sort
    vs = self.values.sort

    arr1 = []
    ks.each_with_index do |x,i|
      arr1.push(x.to_s.ord * i)
    end
    
    arr2 = []
    vs.each_with_index do |x,i|
      arr2.push(x.to_s.ord * i)
    end
    
    return (arr1.sum * arr2.sum).hash
  end
end
