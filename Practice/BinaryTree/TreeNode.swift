//
//  TreeNode.swift
//  LeetCode-Practice
//
//  Created by AF on 14/9/2020.
//  Copyright © 2020 waterfly. All rights reserved.
//

import Foundation

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


class SolutionBinaryTreeBuild {
    func buildTree(_ values: [Int?]) -> TreeNode? {
        guard values.count > 0 else { return nil }
        var root:TreeNode?
        var nodes: [TreeNode?] = [];
        for tmp in values {
            var node: TreeNode? = nil
            if let value = tmp {
                node = TreeNode(value);
            }
            nodes.append(node)
        }
        
        let size = nodes.count
        nodes.forEach { (node) in
            
        }
        
        
        return root
    }
}
