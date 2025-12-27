class MinMaxStack:
    def __init__(self):
        self.items = []
        self.min_max_stack = []

    def peek(self):
        return self.items[-1]

    def pop(self):
        self.min_max_stack.pop()
        return self.items.pop()

    def push(self, item):
        new_min_max = {'min': item, 'max': item}

        if len(self.min_max_stack) > 0:
            last_min_max = self.min_max_stack[-1]
            new_min_max['min'] = min(last_min_max['min'], item)
            new_min_max['max'] = max(last_min_max['max'], item)

        self.min_max_stack.append(new_min_max)
        self.items.append(item)

    def get_min(self):
        return self.min_max_stack[-1]['min']

    def get_max(self):
        return self.min_max_stack[-1]['max']


if __name__ == '__main__':
    stack = MinMaxStack()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(-1)
    stack.pop()
    stack.pop()
