"""
Given a pointer to the head of a linked list and a specific position, determine the data value at that position.
Count backwards from the tail node. The tail is at position 0, its parent is at 1 and so on.
Example
 head refers to 3 -> 2 -> 1 -> 0 -> None
 positionFromTail = 2

Each of the data values matches its distance from the tail.
The value 2 is at the desired position.

"""
#
# Complete the 'getNode' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_SINGLY_LINKED_LIST llist
#  2. INTEGER positionFromTail
#

#
# For your reference:
#
# SinglyLinkedListNode:
#     int data
#     SinglyLinkedListNode next
#
#

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

def get_node(llist, position_from_tail):
    current = llist

    last_pointer = current
    for i in range(position_from_tail):
        last_pointer = last_pointer.next

    print(f"at initial => current: {current.data} - last: {last_pointer.data}")

    while last_pointer.next is not None:
        current = current.next
        last_pointer = last_pointer.next
        print(f"looping => current: {current.data} - last: {last_pointer.data}")

    return current.data


if __name__ == '__main__':
    node1 = Node(3)
    node2 = Node(2)
    node3 = Node(1)
    node4 = Node(0)

    node1.next = node2
    node2.next = node3
    node3.next = node4

    get_node(node1, 2)


