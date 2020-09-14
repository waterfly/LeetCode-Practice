//
//  Traversal.swift
//  LeetCode-Practice
//
//  Created by AF on 2/9/2020.
//  Copyright © 2020 waterfly. All rights reserved.
//



class SolutionTraversal {
    
    //94，144，145
    
    //宽度优先搜索（BFS），迭代实现
    
    //144，前序遍历，迭代实现
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var result: [Int] = [Int]()
        var stack: [TreeNode?] = [root]
        while !stack.isEmpty {
            if let node = stack.removeFirst() {
                result.append(node.val)
                stack.insert(node.right, at: 0)
                stack.insert(node.left, at: 0)
            }
        }
        
        return result
    }
    
    //94
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
//        let closure_iterative_1 = { () -> [Int] in
//            /*
//             迭代算法 1 ，缺点，破坏了树结构，每次入栈，都要打断节点之间关联
//             实现思路：
//                依次入栈左节点，无左节点时，当前节点为最左节点 或 中节点，记录该节点值，同时出栈该节点，然后入栈右节点，这样栈就形成了 左 中 右结构
//
//             思考：对于遍历的方法，必须找到出栈条件（递归的方法则必须找到 递归结构）
//
//             缺点：当前方法会对树进行破坏，因为入栈到最左节点，需要出栈，但是左节点的判断还在，所以必须置空，破坏该无限循环条件。
//             */
//
//            guard root != nil else {
//                return []
//            }
//
//            var result: [Int] = [Int]()
//            var stack: [TreeNode] = [root!]
//            while stack.count > 0 {
//                let node = stack.first;
//                let left = node!.left
//                if left != nil {
//                    //依次入栈左节点
//                    node!.left = nil;           //必须置空，否则会无限循环
//                    stack.insert(left!, at: 0)
//                }else{
//
//                    //无左节点时，出栈当前节点，当前节点为左 或 中
//                    result.append(node!.val)
//                    stack.removeFirst()
//
//                    let right = node!.right
//                    if right != nil {
//                        //入栈右节点
//                        node!.right = nil;      //必须置空，否则会无限循环
//                        stack.insert(right!, at: 0)
//                    }
//                }
//            }
//
//            return result
//        }
//        return closure_iterative_1();
        
        
        
        
//        let closure_iterative_2 = { () -> [Int] in
//            /*
//             迭代算法 2 ，缺点，判断数组是否包含效率不高
//             实现思路：
//                依次入栈左节点，无左节点时，当前节点为最左节点 或 中节点，记录该节点值，同时出栈该节点，然后入栈右节点，这样栈就形成了 左 中 右结构
//
//             思考：对于遍历的方法，必须找到出栈条件（递归的方法则必须找到 递归结构）。
//
//             优化：针对第一版算法的缺点，增加了出栈缓存数组，出栈后的节点不再入栈，这样就不会破坏数的结构
//
//             缺点：每次判断数组是否包含，相当于一次遍历，效率不高
//             */
//
//            guard root != nil else {
//                return []
//            }
//
//            var result: [Int] = [Int]()
//            var stack: [TreeNode] = [root!]
//            var save: [TreeNode] = Array();     //记录出栈的节点，出栈后的节点不再入栈
//            while stack.count > 0 {
//                let node = stack.first;
//                let left = node!.left
//                //已经出栈的节点，不再入栈
//                if left != nil  && !save.contains(where: { (tmp) -> Bool in
//                    return tmp === left!
//                }) {
//                    //依次入栈左节点
//                    stack.insert(left!, at: 0)
//                }else{
//
//                    //无左节点时，出栈当前节点，当前节点为左 或 中
//                    result.append(node!.val)
//                    stack.removeFirst()
//                    save.append(node!)
//
//                    let right = node!.right
//                    if right != nil && !save.contains(where: { (tmp) -> Bool in
//                        return tmp === right!
//                    }) {
//                        //入栈右节点
//                        stack.insert(right!, at: 0)
//                    }
//                }
//            }
//
//            return result
//        }
//        return closure_iterative_2();
        
        
        let closure_iterative_3 = { () -> [Int] in
            /*
             迭代算法 3
             实现思路：
             依次把 左节点入栈，但是用 变量 标示 最左边节点。当变量为空时，开始出栈，出栈的节点只取 右节点，这样就避免了无限循环。
             
             */
            
            guard root != nil else {
                return []
            }
            
            var result: [Int] = [Int]()
            var stack: [TreeNode] = []
            var current = root;
            while current != nil || !stack.isEmpty {
                if current != nil {
                    stack.insert(current!, at: 0)
                    current = current?.left
                }else{
                    current = stack.removeFirst()
                    result.append(current!.val)
                    current = current?.right
                }
            }
            
            
            return result
        }
        return closure_iterative_3();
        
    }
    
    
    /*
     145
     后序遍历，左右中
     思路：左右中，可转化为 中右左，然后翻转
     思考：这里不能直接套用前序遍历的方法，前序遍历的核心是栈有出线的过程，每次循环都会把 中节点 出栈，换成左右节点。
     如果直接用这个思路来思考后序遍历，会发现，循环中没有出栈过程，必须把全部节点都加到一个数组中，按左右中排成正确的顺序才能一个个出栈。
     
     */
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var results = [Int]()
        var stack: [TreeNode?] = [root]
        while !stack.isEmpty {
            if let node = stack.removeFirst() {
                results.append(node.val)
                stack.insert(node.left, at: 0)
                stack.insert(node.right, at: 0)
            }
        }
        
        return results.reversed()
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
        
        inorderTraversal(node);

        //前序遍历 [4, 2, 1, 3, 6, 5, 7]
        //中序遍历 [1, 2, 3, 4, 5, 6, 7]
        //后续遍历 [1, 3, 2, 5, 7, 6, 4]
    }
}




