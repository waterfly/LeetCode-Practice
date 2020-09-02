//
//  Traversal.swift
//  LeetCode-Practice
//
//  Created by AF on 2/9/2020.
//  Copyright © 2020 waterfly. All rights reserved.
//

//Definition for a binary tree node.
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

class SolutionTraversal {
    
    //宽度优先搜索（BFS），迭代实现
    
    //前序遍历，迭代实现
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        
        var result = [Int]()
        var stack: [TreeNode?] = [root]
        while !stack.isEmpty {
            let node = stack.removeFirst()
            if node != nil {
                result.append(node!.val)
            }else{
                continue
            }
            stack.insert(node?.right, at: 0)
            stack.insert(node?.left, at: 0)
        }
        return result
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {

        return []
    }
    
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {

        return []
    }
    
    
    //深度优先搜索（DFS），递归实现
    
    func test(){
        let node = TreeNode.init(4)
        let node1  = TreeNode.init(2)
        let node2  = TreeNode.init(6)
        let node3  = TreeNode.init(1)
        let node4  = TreeNode.init(3)
        let node5  = TreeNode.init(5)
        let node6  = TreeNode.init(7)

        node1.left = node3
        node1.right = node4
        node2.left = node5
        node2.right = node6
        node.left = node1
        node.right = node2

        //前序遍历 [4, 2, 1, 3, 6, 5, 7]
        //中序遍历 [1, 2, 3, 4, 5, 6, 7]
        //后续遍历 [1, 3, 2, 5, 7, 6, 4]
    }
}




