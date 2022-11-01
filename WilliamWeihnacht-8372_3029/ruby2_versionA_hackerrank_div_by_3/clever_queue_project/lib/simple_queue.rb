class SimpleQueue

    def initialize()
        @hidden_array = []
    end

    def size
        @hidden_array.length
    end

    def vacant?
        @hidden_array.empty?
    end

    def front
        @hidden_array[0]
    end

    def back
        @hidden_array[-1]
    end

    def first(n)
        @hidden_array[0...n]
    end

    def last(n)
        @hidden_array[n...@hidden_array.length]
    end

    def enqueue(item)
        @hidden_array<<item
        return @hidden_array.length
    end

    def dequeue
        return nil if @hidden_array.empty?
        return @hidden_array.shift
    end

end