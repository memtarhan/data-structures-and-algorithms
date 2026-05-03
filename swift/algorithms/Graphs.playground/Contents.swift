import Foundation

// Graphs representation
// 1. Vertex: A unique node in the graph (e.g., a city or a user)
// 2. Edge: The connection between two vertices, which can have a weight (e.g., distance or cost)
// 3. Adjacency List: A dictionary-based structure that stores which vertices are connected to each other.
// This is generay more memory-efficient than a matrix for sparse graphs.

// Step 1: The Vertext
// -----------------------------

// Vertex must be Hashable so we can use it as a key in a dictionary
struct Vertex<T: Hashable>: Hashable {
    let data: T
    let index: Int // Useful for mapping to matrices or arrays later
}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(index): \(data)"
    }
}

// Step 2: The Edge
// ----------------------------

// An edge connect a source to a destination.
enum EdgeType {
    case directed // One-way: A -> B
    case undirected // Two-way: A <-> B
}

struct Edge<T: Hashable> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double? // Optional weight for weighted graphs
}

// Step 3: The Adjacenvy List
// --------------------------------

// This is the "brain" of our graph. It manages the relationships between vertices
class AdjacencyList<T: Hashable> {
    // Each vertex maps to an array of outgoing edges
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]

    init() { }

    // Create a vertex and add it to the graph
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data, index: adjacencies.count)
        adjacencies[vertex] = []
        return vertex
    }

    // Connect two vertices
    func addEdge(direction: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double? = nil) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)

        if direction == .undirected {
            let backEdge = Edge(source: destination, destination: source, weight: weight)
            adjacencies[destination]?.append(backEdge)
        }
    }

    // Retrieve edges for a specific vertex
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }
}

extension AdjacencyList: CustomStringConvertible {
    var description: String {
        var result = ""
        for (vertex, edges) in adjacencies {
            let edgeString = edges.map { "\($0.destination.data)" }.joined(separator: ", ")
            result += "\(vertex.data) ---> [ \(edgeString) ]\n"
        }
        return result
    }
}

// let graph = AdjacencyList<String>()
//
// let istanbul = graph.createVertex(data: "Istanbul")
// let london = graph.createVertex(data: "London")
// let tokyo = graph.createVertex(data: "Tokyo")
//
// graph.addEdge(direction: .undirected, from: istanbul, to: london, weight: 2500)
// graph.addEdge(direction: .directed, from: london, to: tokyo, weight: 6000)
//
// print(graph)

// 1. An optimized Queue using two stacks
struct Queue<T> {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []

    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }

    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }

    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}

// 2. The BFS Algorithm
extension AdjacencyList {
    func hasPathBFS(from source: Vertex<T>, to destination: Vertex<T>) -> Bool {
        // A queue to keep track of vertices to visit next
        var queue = Queue<Vertex<T>>()

        // A set to keep track of vertices we've already visited to prevent infinite loops
        var visited: Set<Vertex<T>> = []

        // Start the algorithm by enqueuing the source and marking it visited
        queue.enqueue(source)
        visited.insert(source)

        // Continue exploring as long as there are vertices in the queue
        while let currentVertex = queue.dequeue() {
            // If the current vertex is our destination, we found a path!
            if currentVertex == destination {
                return true
            }

            // Get all edges leaving the current vertex
            let neighborEdges = edges(from: currentVertex)

            for edge in neighborEdges {
                let neighbor = edge.destination

                // If we haven't visited this neighbor, add it to the queue and mark it visited
                if !visited.contains(neighbor) {
                    queue.enqueue(neighbor)
                    visited.insert(neighbor)
                }
            }
        }

        // If the queue empties out and we haven't found the destination, no path exists
        return false
    }
}

let graph = AdjacencyList<String>()

let istanbul = graph.createVertex(data: "Istanbul")
let london = graph.createVertex(data: "London")
let tokyo = graph.createVertex(data: "Tokyo")
let malmo = graph.createVertex(data: "Malmö")
let copenhagen = graph.createVertex(data: "Copenhagen")

// Istanbul <-> London -> Tokyo
graph.addEdge(direction: .undirected, from: istanbul, to: london)
graph.addEdge(direction: .directed, from: london, to: tokyo)

// Malmö <-> Copenhagen (Disconnected from the others)
graph.addEdge(direction: .undirected, from: malmo, to: copenhagen)

// Testing paths
let pathExistsToTokyo = graph.hasPathBFS(from: istanbul, to: tokyo)
print("Path from Istanbul to Tokyo: \(pathExistsToTokyo)") // Output: true

let pathExistsToMalmo = graph.hasPathBFS(from: istanbul, to: malmo)
print("Path from Istanbul to Malmö: \(pathExistsToMalmo)") // Output: false
