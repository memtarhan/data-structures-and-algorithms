#
# Complete the 'reverse' function below.
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
    def __init__(self, value):
        self.value = value
        self.next = None


def print_linked_list(node):
    values = []

    while node is not None:
        values.append(node.value)
        node = node.next

    print(values)


def reverse(llist):
    prev_node = None
    current_node = llist
    next_node = llist.next

    while next_node is not None:
        temp_next_node = next_node.next
        current_node.next = prev_node
        next_node.next = current_node

        prev_node = current_node
        current_node = next_node
        next_node = temp_next_node

    return current_node


if __name__ == '__main__':
    node5 = Node(5)
    node4 = Node(4)
    node3 = Node(3)
    node2 = Node(2)
    node1 = Node(1)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5

    print_linked_list(node1)
    reversed_list = reverse(node1)
    print_linked_list(reversed_list)
