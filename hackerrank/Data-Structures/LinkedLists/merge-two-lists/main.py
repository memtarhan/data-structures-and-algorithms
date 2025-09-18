"""

Given pointers to the heads of two sorted linked lists, merge them into a single, sorted linked list. Either head pointer may be null meaning that the corresponding list is empty.
Example
 headA refers to 1 -> 3 -> 7 -> None
 headB refers to 1 -> 2 -> None
The new list is
Function Description
Complete the mergeLists function in the editor below.
mergeLists has the following parameters:
SinglyLinkedListNode pointer headA: a reference to the head of a list
SinglyLinkedListNode pointer headB: a reference to the head of a list
Returns
SinglyLinkedListNode pointer: a reference to the head of the merged list

"""


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
    pointer1 = head1
    pointer2 = head2

    head = None
    current = None

    while pointer1 is not None or pointer2 is not None:

        if pointer1 is not None and pointer2 is not None:
            # print(f"pointer 1: {pointer1.data} ---- pointer 2: {pointer2.data}")

            if pointer1.data <= pointer2.data:
                if head is None:
                    head = pointer1
                elif current is None:
                    current = pointer1
                    head.next = current
                else:
                    current.next = pointer1
                    current = current.next
                pointer1 = pointer1.next
            else:
                if head is None:
                    head = pointer2
                elif current is None:
                    current = pointer2
                    head.next = current
                else:
                    current.next = pointer2
                    current = current.next
                pointer2 = pointer2.next

        else:
            if pointer1:
                # print(f"pointer 1: {pointer1.data} ---- ")
                if head is None:
                    head = pointer1
                elif current is None:
                    current = pointer1
                    head.next = current
                else:
                    current.next = pointer1
                    current = current.next
                pointer1 = pointer1.next

            elif pointer2:
                # print(f" ---- pointer 2: {pointer2.data}")
                if head is None:
                    head = pointer2
                elif current is None:
                    current = pointer2
                    head.next = current
                else:
                    current.next = pointer2
                    current = current.next
                pointer2 = pointer2.next

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
