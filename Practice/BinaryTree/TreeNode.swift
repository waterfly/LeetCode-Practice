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

//297，二叉树的序列化与反序列化
class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard root != nil else{
            return "";
        }
        
        var result: [String] = Array();
        var stack: [TreeNode?] = [root];
        while !stack.isEmpty {
            var length = stack.count;
            while length > 0 {
                
                
                if let node = stack.removeFirst()  {
                    result.append(String(node.val));
                    
                    stack.append(node.left)
                    stack.append(node.right)
                }else{
                    result.append("null")
                }
                
                length -= 1
            }
        }
        
        let data = try? JSONSerialization.data(withJSONObject: result, options: []);
        if let tmp = data {
            let jsonString = String(data: tmp, encoding: String.Encoding.utf8);
            return jsonString!;
        }else{
            return "";
        }
        
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        guard data.count > 0 else{
            return nil
        }
        let dataString = data.data(using: String.Encoding.utf8)
        let array: Array = try! JSONSerialization.jsonObject(with: dataString!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Array<Any>
        
        for temp in array {
            print(temp);
        }
        
        return nil;
    }
}
