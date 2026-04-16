# Build Min Heap (Heapify)
# Time: O(n), Space: O(1)

A = [-4, 3, 1, 0, 2, 5, 10, 8, 12, 9]

import heapq

heapq.heapify(A)

print(A)

# Heap Sort Time: O(nlogn), Space: O(n)
def heap_sort(arr):
    heapq.heapify(arr)
    n = len(arr)
    new_list = [0] * n 

    for i in range(n):
        min = heapq.heappop(arr)
        new_list[i] = min 

    return new_list

print(heap_sort(A))
