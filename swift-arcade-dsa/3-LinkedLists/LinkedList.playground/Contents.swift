import Foundation

class Node {
    var data: Int
    var next: Node?

    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList {
    private var head: Node?

    // O(1)
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }

    // O(1)
    func getFirst() -> Node? {
        return head
    }

    // O(n)
    func addBack(_ data: Int) {
        let newNode = Node(data)

        guard let head else {
            self.head = newNode
            return
        }

        var temp = head

        while temp.next != nil {
            temp = temp.next!
        }

        temp.next = newNode
    }

    // O(n)
    func getLast() -> Node? {
        if head == nil { return nil }

        var temp = head!
        while temp.next != nil {
            temp = temp.next!
        }

        return temp
    }

    // O(n)
    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }

        let newNode = Node(data)
        var currentNode = head

        for _ in 0 ..< position - 1 {
            currentNode = currentNode?.next
        }

        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }

    // O(1)
    func deleteFirst() {
        head = head?.next
    }

    // O(n)
    func deleteLast() {
        if head == nil { return }

        var previousNode: Node?
        var nextNode = head

        while nextNode?.next != nil {
            previousNode = nextNode
            nextNode = nextNode?.next
        }

        previousNode?.next = nil
    }

    // O(n)
    func delete(position: Int) {
        if head == nil { return }

        var previousNode: Node?
        var nextNode = head

        for _ in 0 ..< position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }

        previousNode?.next = nextNode?.next
    }

    var isEmpty: Bool { head == nil }

    func printLinkedList() {
        if head == nil { return }

        var result = [Int]()
        var node = head
        if let data = node?.data {
            result.append(data)
        }

        while node?.next != nil {
            if let nextData = node?.next?.data {
                result.append(nextData)
            }

            node = node?.next
        }

        print(result)
    }
}

let linkedList = LinkedList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)

linkedList.printLinkedList()

linkedList.addBack(4)
linkedList.printLinkedList()

if let first = linkedList.getFirst() {
    print(first.data)
}

if let last = linkedList.getLast() {
    print(last.data)
}

print("insert")
linkedList.insert(position: 2, data: 5)
linkedList.printLinkedList()

print("deleteFirst")
linkedList.deleteFirst()
linkedList.printLinkedList()

print("deleteLast")
linkedList.deleteLast()
linkedList.printLinkedList()

print("------------------")
let linkedList2 = LinkedList()
linkedList2.addFront(5)
linkedList2.addFront(4)
linkedList2.addFront(3)
linkedList2.addFront(2)
linkedList2.addFront(1)
linkedList2.printLinkedList()

print("delete")
linkedList2.delete(position: 2)
linkedList2.printLinkedList()
