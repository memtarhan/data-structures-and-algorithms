import Foundation

func reverse(_ array: inout [Int]) {
    var left = 0
    var right = array.count - 1

    while left <= right {
        // array.swapAt(left, right)
        let temp = array[right]
        array[right] = array[left]
        array[left] = temp
        left += 1
        right -= 1
    }
}


var input1 = [1, 3, 5, 7]
reverse(&input1)


class A {
    var props: String
    
    init(props: String) {
        self.props = props
    }
}

let a = A(props: "Something")

func updateProps(_ a: A) {
    a.props = "Somehting else"
}

updateProps(a)
print(a.props)
