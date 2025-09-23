class Stack:
    def __init__(self):
        self.data = []

    def push(self, item):
        self.data.append(item)

    def delete(self):
        item = self.data.pop()
        return item

    def peek(self):
        if len(self.data) > 0:
            return self.data[-1]
        else:
            return None


def get_max(operations):
    max_stack = Stack()
    stack = Stack()

    for operation in operations:
        parts = operation.split(" ")
        operation_type = int(parts[0])

        if operation_type == 1:
            # push item
            item = int(parts[1])
            stack.push(item)

            top_value = max_stack.peek()

            if top_value:
                if top_value < item:
                    max_stack.push(item)
            else:
                max_stack.push(item)

        elif operation_type == 2:
            # delete
            value = stack.delete()
            top_value = max_stack.peek()

            if value == top_value:
                max_stack.delete()

        elif operation_type == 3:
            # get max
            print(max_stack.peek())


if __name__ == '__main__':
    ops = ['1 97', '2', '1 20', '2', '1 26', '1 20', '2', '3', '1 91', '3']
    get_max(ops)
