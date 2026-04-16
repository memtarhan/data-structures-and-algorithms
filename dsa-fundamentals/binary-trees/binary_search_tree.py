# Binary Searcg Trees (BSTs)

class TreeNode:
    def __init__(self, val, left=None, right=None):
        self.val = val 
        self.left = left 
        self.right = right 

    def __str__(self):
        return str(self.val)
    


#           5
#       1       8
#    -1   3   7   9

A = TreeNode(5)
B = TreeNode(1)
C = TreeNode(8)
D = TreeNode(-1)
E = TreeNode(3)
F = TreeNode(7)
G = TreeNode(9)

A.left, A.right = B, C 
B.left, B.right = D, E 
C.left, C.right = F, G 

# Recursive In Order Traversal (DFS) Time: O(n), Space: O(n)
def inorder(node):
    if not node:
        return 
    
    inorder(node.left)
    print(node)
    inorder(node.right)

inorder(A)
print("-"*20)


# Time: O(logn), Space: O(logn)
def search_bst(node, target):
    if not node: 
        return False 
    
    if node.val == target:
        return True 
    
    if target < node.val: return search_bst(node.left, target)
    else: return search_bst(node.right, target)


print(search_bst(A, 8))
print(search_bst(A, 10))