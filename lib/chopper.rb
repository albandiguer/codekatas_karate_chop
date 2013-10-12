class Chopper

  def chop(target, values)
    return -1 if values.empty?
    return -1 if target < values[0] || target > values[-1]
    return 0 if values.size == 1

    if chop(target, values.reduce(target)) == -1
      return -1
    else 
      return values.reduce_index(target) + chop(target, values.reduce(target))
    end
  end

private

  Array.class_eval do 
    def median 
      median = size/2
      median_index = median - 1
      ArrayElement.new(median_index, self[median_index])
    end

    def reduce(target)
      target <= median.value ? 
        slice(0..median.index) : 
        slice(median.index + 1..-1)
    end

    def reduce_index(target)
      target <= median.value ? 0 : median.index + 1 
    end
  end

  class ArrayElement < Struct.new(:index, :value)
  end

end
