 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }

class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        
        // Create empty stack to hold our initial values
        var stack1 = [TreeNode]()
        
        // We create a second stack to hold our reversed nodes
        var stack2 = [TreeNode]()
        
        if let root = root {
            stack1.append(root)
            while !stack1.isEmpty {
                guard let node = stack1.popLast() else { return []}
                stack2.append(node)
        
                // Check if the current node has any children
                if let leftChild = node.left {
                    stack1.append(leftChild)
                }
                
                if let rightChild = node.right {
                    stack1.append(rightChild)
                }
            }
        }
        
        // Take our second stack and reverse all of the nodes
        return stack2.map { $0.val }.reversed()
    }
}
 
let root = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
 
root.right = node2
node2.left = node3
 

let s = Solution()
print(s.postorderTraversal(root))