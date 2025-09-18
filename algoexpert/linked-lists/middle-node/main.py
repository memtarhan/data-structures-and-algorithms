"""
Middle Node
You're given a Linked List with at least one node. Write a function that returns the middle node of the Linked List.
If there are two middle nodes (i.e. an even length list), your function should return the second of these nodes.
Each LinkedList node has an integer value as well as a next node pointing to the next node in the list or
to None / null if it's the tail of the list.


Sample Input
linkedList = 2 > 7 > 3 -> 5

Sample Output
I/ The middle could be 7 or 3,
3 -> 5 // we return the second middle node

"""


# This is an input class. Do not edit.
class LinkedList:
    def __init__(self, value):
        self.value = value
        self.next = None

    def values(self):
        temp = self.next
        values = [self.value]
        while temp is not None:
            values.append(temp.value)
            temp = temp.next

        return values


def middleNode(linkedList):
    count = 0
    indices = {}

    node = linkedList
    while node is not None:
        count += 1
        indices[count] = node
        node = node.next

    if count % 2 == 0:
        middle_index = int(count / 2) + 1
    else:
        middle_index = int(count / 2 + 0.5)
    print(f"count: {count} ---- middle: {middle_index}")

    return indices[middle_index]


if __name__ == '__main__':
    l3 = LinkedList(5)
    l2 = LinkedList(3)
    l1 = LinkedList(7)
    l0 = LinkedList(2)

    l0.next = l1
    l1.next = l2
    l2.next = l3

    middle = middleNode(l0)

    print(middle.values)
