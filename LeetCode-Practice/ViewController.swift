//
//  ViewController.swift
//  LeetCode-Practice
//
//  Created by AF on 2/9/2020.
//  Copyright © 2020 waterfly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
//        var array: [String?] = Array()
//        let test: String? = nil
//        array.append(test)
//        print(array)
     
        let string = "abcdefcaefgh";
        let result = Solution_3().lengthOfLongestSubstring(string)
        print(result)
    }


}

