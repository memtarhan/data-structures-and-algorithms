# Complete the compare_lists function below.

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


def print_linked_list(node):
    values = []

    while node is not None:
        values.append(node.data)
        node = node.next

    print(values)


def compare_lists(llist1, llist2):
    current1 = llist1
    current2 = llist2

    while current1 is not None and current2 is not None:
        print("comparing...")
        if not (current1.data == current2.data):
            print("not equal, terminating...")
            return 0

        current1 = current1.next
        current2 = current2.next

    if current1 is None and current2 is None:
        return 1
    else:
        return 0


if __name__ == '__main__':
    node4 = Node(4)
    node3 = Node(3)
    node2 = Node(2)
    node1 = Node(1)
    node1.next = node2
    node2.next = node3
    node3.next = node4

    node8 = Node(4)
    node7 = Node(3)
    node6 = Node(2)
    node5 = Node(1)
    node5.next = node6
    node6.next = node7
    node7.next = node8

    print_linked_list(node1)
    print_linked_list(node5)

    print(compare_lists(node1, node5))
