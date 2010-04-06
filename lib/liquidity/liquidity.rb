class Array
  
  #Though I would imagine you would typically be using this for doing liquid layouts on the web, for the purposes of instruction, we'll
  #imagine that we have the following method for printing out an array: 
  #
  #  require 'liquidity'
  #
  #  def print_matrix(a)
  #    a.each_slice(3) do |slice|
  #      puts slice.join("\t")
  #    end
  #  end
  #
  #If we passed off the array of (1..11) to it, we would see the following printed: 
  #
  #  a = (1..11).to_a
  #  print_matrix a
  #  # ==> 
  #    1   2   3
  #    4   5   6
  #    7   8   9
  #    10  11
  #   
  #Now, imagine that we wanted see the matrix where the data was sorted into columns, not rows. We can use the "column\_sort" method 
  #provided by the "liquidity" gem: 
  #
  #  a = (1..11).to_a
  #  print_matrix a.column_sort(3)
  #  # ==> 
  #    1   5   9
  #    2   6   10
  #    3   7   11 
  #    4   8
  #
  #== Passing a block to column_sort 
  #
  #Just like the {Array::sort}[http://ruby-doc.org/core/classes/Array.html#M002185] method, you can pass a block to column_sort. 
  def column_sort(num_columns, &block)
    new_array = block ? sort(&block) : self.dup
    new_length = new_array.length % num_columns == 0 ? new_array.length : new_array.length + num_columns - new_array.length % num_columns
    new_array.pad(new_length).slices(num_columns).transpose.flatten
  end
  
  # todo, add a column_sort! method
  #def column_sort(num_columns, &block)
  #  dup.column_sort!
  #end

  # pad an array to a new length, adding nil elements onto the end of the collection 
  def pad(new_length)
    if new_length > length
      self + ([nil] * (new_length - length))
    else
      self
    end
  end

  # return a new array, sliced up into a given number of smaller arrays.
  # e.g.: 
  #   [1,2,3,4].slices(2) #==> [[1,2],[3,4]]
  def slices(num_slices)
    array_of_slices = []
    each_slice(length / num_slices) { |s| array_of_slices << s }
    array_of_slices
  end
end
