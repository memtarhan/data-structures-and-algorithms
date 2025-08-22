class Node:
    def __init__(self, value):
        self.value = value
        self.next = None


class LinkedList:
    def __init__(self, value=None):
        if value:
            new_node = Node(value)
            self.head = new_node
            self.tail = new_node
            self.length = 1
        else:
            self.head = None
            self.tail = None
            self.length = 0

    def print_list(self):
        temp = self.head
        while temp:
            print(temp.value)
            temp = temp.next

    def append(self, value):
        new_node = Node(value)
        if self.length == 0:
            self.head = new_node
            self.tail = new_node
            self.length = 1
        else:
            self.tail.next = new_node
            self.tail = new_node
            self.length += 1


my_linked_list = LinkedList()

my_linked_list.append(1)
my_linked_list.append(2)
my_linked_list.append(3)

print('Head:', my_linked_list.head)
print('Tail:', my_linked_list.tail)
print('Length:', my_linked_list.length)

print('List...')
my_linked_list.print_list()
