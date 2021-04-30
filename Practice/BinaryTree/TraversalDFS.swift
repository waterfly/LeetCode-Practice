//
//  TraversalDFS.swift
//  LeetCode-Practice
//
//  Created by AF on 30/4/2021.
//  Copyright © 2021 waterfly. All rights reserved.
//

import Foundation


//DFS，递归实现二叉树遍历
class SolutionTraversalDFS {

    //144，前序遍历,DFS，递归实现
    func preorderTraversalDFS(_ root: TreeNode?) -> [Int] {
        
        
        func preorder(_ root: TreeNode?,_ result: [Int]) -> [Int]{
            guard root != nil else {
                return result
            }
            
            var modify = Array.init(result)
            modify.append(root!.val)
            modify.append(contentsOf: preorder(root!.left, result))
            modify.append(contentsOf: preorder(root!.right, result))
            return modify
            
        }
        
        guard root != nil else {
            return []
        }
        
        return preorder(root, [Int]())
    }
    
    //94，中序遍历，DFS，Left、Root、Right
    func inorderTraversalDFS(_ root: TreeNode?) -> [Int] {
        func inorder(_ root: TreeNode?,_ result: [Int]) -> [Int]{
            guard root != nil else {
                return result
            }
            
            var modify = Array.init(result)
            modify.append(contentsOf: inorder(root!.left, result))
            modify.append(root!.val)
            modify.append(contentsOf: inorder(root!.right, result))
            return modify
            
        }
        
        guard root != nil else {
            return []
        }
        return inorder(root, [Int]())
    }
    
    //145，后序遍历，左右中
    func postorderTraversalDFS(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        
        func postorder(_ root: TreeNode?,_ result: [Int]) -> [Int]{
            guard root != nil else {
                return result
            }
            var modify = Array.init(result)
            modify.append(contentsOf: postorder(root!.left, result))
            modify.append(contentsOf: postorder(root!.right, result))
            modify.append(root!.val)
            return modify
        }
        return postorder(root, [Int]())
    }
    
}
