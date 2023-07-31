def bubble_sort(bubble_array)
   bubble_array.each_with_index do |item, index|
      if bubble_array[index + 1] != nil && item > bubble_array[index + 1]
       bubble_array[index], bubble_array[index + 1] = bubble_array[index + 1], bubble_array[index]
       bubble_sort(bubble_array)
      end
    end
    bubble_array
end


p bubble_sort([4,3,78,2,0,2])
