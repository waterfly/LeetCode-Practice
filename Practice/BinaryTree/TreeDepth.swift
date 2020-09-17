//
//  TreeDepth.swift
//  LeetCode-Practice
//
//  Created by AF on 14/9/2020.
//  Copyright © 2020 waterfly. All rights reserved.
//

import Foundation


//104, 二叉树的最大深度/Maximum Depth of Binary Tree
class SolutionBinary_TreeDepthMax {
    
    //DFS 深度优先遍历，使用递归
    func dfsDepth(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    
    //BFS 广度优先遍历，层序遍历
    func bfsDepth(_ root: TreeNode?) -> Int {
        guard root != nil else{
            return 0
        }
        
        var max: Int = 0
        var level: [TreeNode?] = [root];
        while !level.isEmpty {
            max += 1
            
            //这里会多创建个数组，增大开销
            var tmp: [TreeNode?] = Array()
            for node in level {
                if let left = node?.left{
                    tmp.append(left)
                }
                if let right = node?.right{
                    tmp.append(right)
                }
            }
            
            level = tmp
            
        }
        
        return max;
    }
    
    //BFS 广度优先遍历 优化，省去数组创建开销
    func bfsDepthOptimize(_ root: TreeNode?) -> Int {
        guard root != nil else{
            return 0
        }
        
        var max: Int = 0
        var level: [TreeNode?] = [root]
        while !level.isEmpty {
            max += 1
            
            //使用 整数变量来标示，减少数组开销
            var size = level.count
            while size > 0 {
                let node = level.removeFirst()
                if let left = node?.left{
                    level.append(left)
                }
                if let right = node?.right{
                    level.append(right)
                }
                size -= 1
            }
            
        }
        
        return max;
    }
    
    
    func maxDepth(_ root: TreeNode?) -> Int {
        
        //DFS
        return dfsDepth(root);
        
        //BFS
//        return bfsDepth(root);
        
        //BFS Optimize
//        return bfsDepthOptimize(root)
    }
}

//111, 二叉树的最小深度/Minimum Depth of Binary Tree
class SolutionBinaryTreeDepthMin {
    
    //DFS，深度优先遍历，递归方法
    func bfsMinDepthRecurse(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        
        
        if root?.left != nil && root?.right != nil {
            return min(bfsMinDepthRecurse(root?.left), bfsMinDepthRecurse(root?.right)) + 1
        }else if root?.left != nil {
            return bfsMinDepthRecurse(root?.left) + 1
        }else{
            return bfsMinDepthRecurse(root?.right) + 1
        }
    }
    
    //BFS，广度优先遍历
    func bfsMinDepth(_ root: TreeNode?) -> Int {
        guard root != nil else{ return 0 }
        
        var minValue: Int = 0;
        var level: [TreeNode?] = [root]
        while !level.isEmpty {
            var count = level.count
            minValue += 1
            
            while count > 0 {
                let node = level.removeFirst()
                //遇见叶节点，则停止
                if node?.left == nil && node?.right == nil{
                    return minValue
                }else{
                    if node?.left != nil { level.append(node?.left) }
                    if node?.right != nil { level.append(node?.right) }
                }
                
                count -= 1
            }
        }
        
        return minValue
    }
    
    func minDepth(_ root: TreeNode?) -> Int {
        
        //BFS，迭代方法
        return bfsMinDepth(root);
        
//        //DFS，递归方法
//        return bfsMinDepthRecurse(root)
    }
}
