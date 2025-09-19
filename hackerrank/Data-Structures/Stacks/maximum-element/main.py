class Stack:
    def __init__(self, max_stack=None):
        self.data = []
        self.max_stack = max_stack

    def push(self, item):
        self.data.append(item)
        if self.max_stack is not None:
            self.max_stack.push(item)

        else:
            if self.max_stack.peek() is not None:
                if self.max_stack.peek() < item:
                    self.max_stack.push(item)
            else:
                self.max_stack.push(item)

    def delete(self):
        item = self.data.pop()
        if item == self.max_stack.peek():
            self.max_stack.pop()

    def peek(self):
        if len(self.data) > 0:
            return self.data[-1]
        else:
            return None

    def get_max(self):
        return self.max_stack.peek()


def get_max(operations):
    max_stack = Stack()
    stack = Stack(max_stack=max_stack)

    for operation in operations:
        parts = operation.split(" ")
        operation_type = int(parts[0])

        if operation_type == 1:
            # push item
            item = int(parts[1])
            stack.push(item)
        elif operation_type == 2:
            # delete
            stack.delete()
        elif operation_type == 3:
            # get max
            print(stack.get_max())


if __name__ == '__main__':
    operations = ['1 97', '2', '1 20', '2', '1 26', '1 20', '2', '3', '1 91', 3]
    get_max(operations)
