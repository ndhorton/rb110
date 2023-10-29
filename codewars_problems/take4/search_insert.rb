# Leetcode 35

def binary_search(nums, target)
  left = 0
  right = nums.size
  mid = right / 2
  loop do
    return mid if nums[mid] == target
    return "404: Not found" if right - left <= 1
    if nums[mid] > target
      right = mid
      mid = (left + right) / 2
    else
      left = mid
      mid = (left + right) / 2
    end
  end
end

def search_insert(nums, target)
  left = 0
  right = nums.size 
  mid = right / 2
  loop do
    return mid if nums[mid] == target
    if right - left <= 1
      return (nums[mid] > target ? left : right)
    end
    if nums[mid] > target
      right = mid
      mid = (left + right) / 2
    else
      left = mid
      mid = (left + right) / 2
    end
  end
end

arr_missing = [1, 2, 3, 4, 6, 7]
arr = [1, 2, 3, 4, 5, 6]

p binary_search(arr_missing, 5) == "404: Not found"
p binary_search(arr, 1) == 0
p binary_search(arr, 6) == 5
p binary_search(arr, 2) == 1
p binary_search(arr, 5) == 4
p binary_search(arr, 4) == 3

p search_insert(arr_missing, 5) == 4
p search_insert([1, 2, 3, 4, 5, 6], 5) == 4
p search_insert([1, 2, 3, 4, 5, 6], 1) == 0
p search_insert([1, 2, 3, 4, 5, 6], 6) == 5
p search_insert([1, 2, 3, 4, 5, 6], 7) == 6
p search_insert([1, 2, 3, 4, 5, 6], 0) == 0