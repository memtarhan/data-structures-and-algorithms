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

    max_data = []

    for operation in operations:
        parts = operation.split(" ")
        operation_type = int(parts[0])

        if operation_type == 1:
            # push item
            value = int(parts[1])
            stack.push(value)

            top_value = max_stack.peek()

            if top_value:
                if top_value < value:
                    max_stack.push(value)
            else:
                max_stack.push(value)

        elif operation_type == 2:
            # delete
            value = stack.delete()
            top_value = max_stack.peek()

            if value == top_value:
                max_stack.delete()

        elif operation_type == 3:
            # get max
            max_value = max_stack.peek()
            if max_value == 69:
                print("found!")
            if max_value:
                max_data.append(max_value)

    return max_data


if __name__ == '__main__':
    # ops = ['1 97', '2', '1 20', '2', '1 26', '1 20', '2', '3', '1 91', '3']
    # get_max(ops)

    n = int(input().strip())

    ops = []

    for _ in range(n):
        ops_item = input()
        ops.append(ops_item)

    res = get_max(ops)

    for item in res:
        print(item)
