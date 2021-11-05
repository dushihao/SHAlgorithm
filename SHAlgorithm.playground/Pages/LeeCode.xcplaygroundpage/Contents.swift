//: [Previous](@previous)

import Foundation



class Solution {
    
    /**
     1. 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

     有效字符串需满足：

     左括号必须用相同类型的右括号闭合。
     左括号必须以正确的顺序闭合。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/valid-parentheses
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    // 利用栈先进后出的特点
    func isValidString(_ s: String) -> Bool {
        var array = [Character]()
        let reg: [Character: Character] = [")": "(", "}": "{", "]": "["]

        for char in s {
            if reg.values.contains(char) {
                array.append(char)
            } else {
                guard let top = array.popLast() else { return false }
                
                if reg[char] == top  {
                    continue
                } else {
                    return false
                }
            }
        }

        return array.isEmpty
    }
    
    // 53. 最大子序和
    // 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
    // 动态规划
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxAns = nums[0]
        var pre = 0
        for i in 0...nums.count - 1 {
            pre = max(pre + nums[i], nums[i])
            maxAns = max(maxAns, pre)
//            print("pre = \(pre), maxAns = \(maxAns)")
        }
        
        return maxAns
    }
}

let s = Solution()
s.isValidString("{()[()]}")

let nums = [-2,1,-3,4,-1,2,1,-5,4]
s.maxSubArray(nums)
//: [Next](@next)
