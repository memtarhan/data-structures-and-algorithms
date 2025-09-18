"""
Remove Duplicates From Linked List
You're given the head of a Singly Linked List whose nodes are in sorted order with respect to their values.
Write a function that returns a modified version of the Linked List that doesn't contain any nodes with duplicate
values. The Linked List should be modified in place (i.e., you shouldn't create a brand-new list), and the modified
Linked List should still have its nodes sorted with respect to their values.
Each LinkedList node has an integer value as well as a
next node pointing to the next node in
the list or to None / null if it's the tail of the list.


Sample Input
linkedList = 1 > 1 > 3 -> 4 -> 4 →> 4 -> 5 →> 6 →> 6 // the head node with value of 1

Sample Output
1 → 3 → 4 → 5 - 611 the head node with value 1

"""


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


"""
index = 0 (Node=1)
checked = {}
list = [1, 1, 2, 3, 4, 4, 4, 5, 6, 6]
current = 1 
next = 1


"""


# Time = O(n)
# Space = O(n)
def remove_duplicates(node):
    checked = {}
    previous = None
    current = node

    while current is not None:
        if current.value in checked:
            previous.next = current.next

        else:
            checked[current.value] = True
            previous = current

        current = current.next

    return node


# Time = O(n)
# Space = O(1)
def remove_duplicates_2(node):
    current_node = node

    while current_node is not None:
        next_distinct_node = current_node.next

        while next_distinct_node is not None and next_distinct_node.value == current_node.value:
            next_distinct_node = next_distinct_node.next

        current_node.next = next_distinct_node
        current_node = next_distinct_node

    return node


if __name__ == '__main__':
    l7 = LinkedList(6)
    l6 = LinkedList(6)
    l5 = LinkedList(5)
    l4 = LinkedList(4)
    l3 = LinkedList(4)
    l2 = LinkedList(4)
    l1 = LinkedList(3)
    l0 = LinkedList(1)
    l8 = LinkedList(1)

    l8.next = l0
    l0.next = l1
    l1.next = l2
    l2.next = l3
    l3.next = l4
    l4.next = l5
    l5.next = l6
    l6.next = l7

    remove_1 = remove_duplicates(l8).values()
    print(remove_1)
    remove_2 = remove_duplicates_2(l8).values()
    print(remove_2)
