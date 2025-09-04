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

    func getFirst() -> Node? {
        return head
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
