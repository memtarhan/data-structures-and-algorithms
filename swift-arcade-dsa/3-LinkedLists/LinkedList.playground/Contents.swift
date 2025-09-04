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
