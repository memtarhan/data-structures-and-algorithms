# Binary Tree

class TreeNode:
    def __init__(self, val, left=None, right=None):
        self.val = val 
        self.left = left 
        self.right = right 

    def __str__(self):
        return str(self.val)
    

#           1
#     2           3
#   4  5        10

A = TreeNode(1)
B = TreeNode(2)
C = TreeNode(3)
D = TreeNode(4)
E = TreeNode(5)
F = TreeNode(10)

A.left = B 
A.right = C 
B.left = D 
B.right = E 
C.left = F 


# Recursive Pre Order Traversal (DFS) Time: O(n), Space: O(n)
def preorder(node):
    if not node:
        return 
    print(node)
    preorder(node.left)
    preorder(node.right)


preorder(A)
print("-"*20)

# Recursive In Order Traversal (DFS) Time: O(n), Space: O(n)
def inorder(node):
    if not node:
        return 
    
    inorder(node.left)
    print(node)
    inorder(node.right)

inorder(A)
print("-"*20)

# Recursive Post Order Traversal (DFS) Time: O(n), Space: O(n)
def postorder(node):
    if not node:
        return 
    
    postorder(node.left)
    postorder(node.right)
    print(node)

postorder(A)
print("-"*20)


# Iterative Pre Order Traversal (DFS) Time: O(n), Space: O(n)
def preorder_iterative(node):
    stk = [node]

    while stk: 
        node = stk.pop()
        print(node)

        if node.right: stk.append(node.right)
        if node.left: stk.append(node.left)

preorder_iterative(A)
print("-"*20)


# Level Order Traversal (BFS) Time: O(n), Space: O(n)
from collections import deque

def level_order(node):
    q = deque()
    q.append(node)

    while q: 
        node = q.popleft()
        print(node)
        if node.left: q.append(node.left)
        if node.right: q.append(node.right)


level_order(A)
print("-"*20)


# Check If Value Exists (DFS) Time: O(n), Space: O(n)
def search(node, target):
    if not node:
        return False 
    
    if node.val == target:
        return True 
    
    return search(node.left, target) or search(node.right, target)


print(search(A, 10))