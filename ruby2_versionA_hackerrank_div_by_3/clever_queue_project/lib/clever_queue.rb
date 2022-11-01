require "byebug"

class CleverQueue < SimpleQueue

    def initialize(capacity,soft_limit)
        super()
        raise "invalid args" if soft_limit > capacity
        @capacity = capacity
        @soft_limit = soft_limit
    end

    def capacity
        @capacity
    end

    def soft_limit
        @soft_limit
    end

    def soft_limit=(n)
        @soft_limit = n
    end

    def enqueue(*args)
        if args.length + @hidden_array.length > @capacity
            raise "queue is full"
        end
        args.each do |arg|
            @hidden_array<<arg
        end
        return @hidden_array.length
    end

    def dequeue(n=1)
        arr = []
        n.times do
            arr<<@hidden_array.shift
        end
        return arr
    end

    def trim
        return false if @hidden_array.length < @soft_limit
        @hidden_array = @hidden_array[0...soft_limit]
        true
    end

end