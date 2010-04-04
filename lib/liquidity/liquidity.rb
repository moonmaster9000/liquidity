class Array
  def column_sort(num_columns, &block)
    new_array = sort(&block)
    new_length = new_array.length % num_columns == 0 ? new_array.length : new_array.length + num_columns - new_array.length % num_columns
    new_array.pad(new_length).slices(num_columns).transpose.flatten
  end

  def pad(new_length)
    if new_length > length
      self + ([nil] * (new_length - length))
    else
      self
    end
  end

  def slices(num_slices)
    array_of_slices = []
    each_slice(length / num_slices) { |s| array_of_slices << s }
    array_of_slices
  end
end
