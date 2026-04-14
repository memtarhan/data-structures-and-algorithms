"""
You are given the pointer to the head node of a sorted linked list, where the data in the nodes is in ascending order.
Delete nodes and return a sorted list with each distinct value in the original list. The given head pointer
may be null indicating that the list is empty.
Example
 head refers to the first node in the list 1 -> 2 -> 2 -> 3 -> 3 -> 3 -> 3 -> None
Remove 1 of the 2 data values and return  pointing to the revised list .
1 -> 2 -> 3 -> None

"""


#
# Complete the 'removeDuplicates' function below.
#
# The function is expected to return an INTEGER_SINGLY_LINKED_LIST.
# The function accepts INTEGER_SINGLY_LINKED_LIST llist as parameter.
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


def remove_duplicates(llist):
    checked = {}
    previous = None
    current = llist

    while current is not None:
        if current.data in checked:
            previous.next = current.next

        else:
            checked[current.data] = True
            previous = current

        current = current.next

    return llist

def print_linked_list(node):
    values = []

    while node is not None:
        values.append(node.data)
        node = node.next

    print(values)


if __name__ == '__main__':
    node1 = Node(1)
    node2 = Node(2)
    node3 = Node(2)
    node4 = Node(3)
    node5 = Node(3)
    node6 = Node(3)
    node7 = Node(3)

    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    node5.next = node6
    node6.next = node7

    print_linked_list(node1)
    remove_duplicates(node1)
    print_linked_list(node1)
