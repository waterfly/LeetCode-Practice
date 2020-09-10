//
//  Question_3_ LongestSubstring.swift
//  LeetCode-Practice
//
//  Created by AF on 10/9/2020.
//  Copyright © 2020 waterfly. All rights reserved.
//

class Solution_3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        guard s.count > 0 else {
            return 0
        }
        
        var left = 0 , maxLen = 0, cache = [Character: Int]()
        for (right, value) in s.enumerated() {
            if cache.keys.contains(value) {
                left = max(left, cache[value]!)
            }
            
            cache[value] = right + 1
            maxLen = max(maxLen, right - left + 1)
        }
        return maxLen
    }
}
