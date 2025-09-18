# Complete the mergeLists function below.

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


def merge_lists(head1, head2):
    current1 = head1
    current2 = head2

    head = None
    current = head

    while current1 is not None or current2 is not None:
        if current1 is not None and current2 is not None:
            if current1.data >= current2.data:
                current = current1
                current1 = current1.next
            else:
                current = current2
                current2 = current2.next

        elif current1 is not None:
            current = current1
            current1 = current1.next

        else:
            current = current2
            current2 = current2.next

        if head is None:
            head = current
        else:
            current.next = current

    return head


if __name__ == '__main__':
    node1 = Node(1)
    node2 = Node(3)
    node3 = Node(7)
    node1.next = node2
    node2.next = node3

    print_linked_list(node1)

    node4 = Node(1)
    node5 = Node(2)
    node4.next = node5

    print_linked_list(node4)

    merged_list = merge_lists(node1, node4)
    print_linked_list(merged_list)
