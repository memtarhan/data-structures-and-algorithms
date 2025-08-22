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

        return True

    def pop(self):
        if self.length == 0:
            return None
        else:
            temp = self.head
            prev = self.head

            while temp.next:
                prev = temp
                temp = temp.next

            self.tail = prev
            self.tail.next = None
            self.length -= 1

            if self.length == 0:
                self.head = None
                self.tail = None

            return temp

    def prepend(self, value):
        new_node = Node(value)
        if self.length == 0:
            self.head = new_node
            self.tail = new_node
        else:
            new_node.next = self.head
            self.head = new_node
        self.length += 1

        return True

    def pop_first(self):
        if self.length == 0:
            return None
        temp = self.head
        self.head = self.head.next
        temp.next = None
        self.length -= 1
        if self.length == 0:
            self.tail = None

        return temp

    def get(self, index):
        if index < 0 or index >= self.length:
            return None

        temp = self.head

        for _ in range(index):
            temp = temp.next

        return temp

    def set_value(self, index, value):
        temp = self.get(index)
        if temp:
            temp.value = value
            return True

        return False

    def insert(self, index, value):
        if index < 0 or index > self.length:
            return False

        if index == 0:
            return self.prepend(value)

        if index == self.length:
            return self.append(value)

        temp = self.get(index - 1)
        new_node = Node(value)
        new_node.next = temp.next
        temp.next = new_node
        self.length += 1

        return True

    def remove(self, index):
        if index < 0 or index >= self.length:
            return None

        if index == 0:
            return self.pop_first()

        if index == self.length - 1:
            return self.pop()

        prev = self.get(index - 1)
        temp = prev.next
        prev.next = temp.next
        temp.next = None
        self.length -= 1

        return temp


my_linked_list = LinkedList()

my_linked_list.append(1)
my_linked_list.append(2)
my_linked_list.append(3)

print('Head:', my_linked_list.head)
print('Tail:', my_linked_list.tail)
print('Length:', my_linked_list.length)

print('List...')
my_linked_list.print_list()

my_linked_list.pop()
print('List after pop')
my_linked_list.print_list()

my_linked_list.pop()
print('List after pop')
my_linked_list.print_list()

my_linked_list.pop()
print('List after pop')
my_linked_list.print_list()

my_linked_list.prepend(1)
print('List after prepend')
my_linked_list.print_list()

my_linked_list.prepend(2)
print('List after prepend')
my_linked_list.print_list()

my_linked_list.prepend(3)
print('List after prepend')
my_linked_list.print_list()

print('Head:', my_linked_list.head.value)
print('Tail:', my_linked_list.tail.value)

my_linked_list.print_list()

print('Pop first: ', my_linked_list.pop_first().value)
print('Get at #1: ', my_linked_list.get(1).value)

my_linked_list.set_value(0, 6)
my_linked_list.print_list()

my_linked_list.insert(0, 9)
my_linked_list.print_list()

print("removing...")
my_linked_list.remove(0)
my_linked_list.remove(0)
my_linked_list.print_list()