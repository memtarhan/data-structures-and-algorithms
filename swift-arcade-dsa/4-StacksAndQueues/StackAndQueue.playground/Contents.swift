class Stack<T> {
    private var array = [T]()

    func push(_ item: T) {
        array.append(item)
    }

    func pop() -> T? {
        array.popLast()
    }

    var peek: T? {
        array.last
    }

    var isEmpty: Bool {
        array.isEmpty
    }

    var count: Int {
        array.count
    }
}

class Queue<T> {
    private var array = [T]()

    func enqueue(_ item: T) {
        array.append(item)
    }

    func dequeue() -> T? {
        array.removeFirst()
    }

    var peek: T? {
        array.first
    }

    var isEmpty: Bool {
        array.isEmpty
    }

    var count: Int {
        array.count
    }
}
