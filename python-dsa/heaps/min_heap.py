class MinHeap:
    def __init__(self):
        self.heap = []

    def _left_child(self, index):
        return 2 * index + 1

    def _right_child(self, index):
        return 2 * index + 2

    def _parent(self, index):
        return (index - 1) // 2

    def _swap(self, index1, index2):
        self.heap[index1], self.heap[index2] = self.heap[index2], self.heap[index1]

    def insert(self, value):
        # Append the new value at the end of the heap
        self.heap.append(value)

        # Set current index to the index of the newly inserted element
        current = len(self.heap) - 1

        # Loop while the current node is not the root (index > 0) and
        # its value is less than its parent's value
        while current > 0 and self.heap[current] < self.heap[self._parent(current)]:
            # If the condition is met, swap the current node with its parent
            self._swap(current, self._parent(current))

            # Update current index to the index of the parent node
            current = self._parent(current)

    def remove(self):
        # If heap is empty, return None
        if len(self.heap) == 0:
            return None

        # If heap has only one element, pop and return it
        if len(self.heap) == 1:
            return self.heap.pop()

        # Store the minimum value (root of the min heap)
        min_value = self.heap[0]

        # Replace the root of the heap with the last element of the heap,
        # and then remove the last element
        self.heap[0] = self.heap.pop()

        # Restore the heap property by sinking down the new root
        self._sink_down(0)

        # Return the minimum value that has been removed
        return min_value

    def _sink_down(self, index):
        # Start at the provided index
        min_index = index

        # Continue until the heap property is restored
        while True:
            # Calculate indices of left and right children
            left_index = self._left_child(index)
            right_index = self._right_child(index)

            # If the left child exists and is less than the current node,
            # update min_index to left child's index
            if (left_index < len(self.heap) and
                    self.heap[left_index] < self.heap[min_index]):
                min_index = left_index

            # If the right child exists and is less than the current smallest node,
            # update min_index to right child's index
            if (right_index < len(self.heap) and
                    self.heap[right_index] < self.heap[min_index]):
                min_index = right_index

            # If the smallest value isn't at the current index,
            # swap the smallest value with the current node
            if min_index != index:
                self._swap(index, min_index)

                # Update the current index to the min_index
                index = min_index
            else:
                # If the smallest value is already at the current index,
                # we can stop sinking down
                return


myheap = MinHeap()
myheap.insert(12)
myheap.insert(10)
myheap.insert(8)
myheap.insert(6)
myheap.insert(4)
myheap.insert(2)

print(myheap.heap)  # [2, 6, 4, 12, 8, 10]

removed = myheap.remove()
print(f'Removed: {removed}, Heap: {myheap.heap}')  # Removed: 2, Heap: [4, 6, 10, 12, 8]

removed = myheap.remove()
print(f'Removed: {removed}, Heap: {myheap.heap}')  # Removed: 4, Heap: [6, 8, 10, 12]

removed = myheap.remove()
print(f'Removed: {removed}, Heap: {myheap.heap}')  # Removed: 6, Heap: [8, 12, 10]

"""
    EXPECTED OUTPUT:
    ----------------
    [2, 6, 4, 12, 8, 10]
    Removed: 2, Heap: [4, 6, 10, 12, 8]
    Removed: 4, Heap: [6, 8, 10, 12]
    Removed: 6, Heap: [8, 12, 10]

"""
