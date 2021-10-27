//: [Previous](@previous)

import Foundation

// https://labuladong.gitee.io/algo/1/4/

// 全排列问题
var res = [[Int]]()
var originalNums = [Int]()

func backTrack(_ nums: [Int], _ track: inout [Int]) {
    if nums.count == track.count {
        res.append(track)
        return
    }
    
    for (_, item) in nums.enumerated() {
        if track.contains(item) { continue }
        
        track.append(item)
        backTrack(nums, &track)
        track.removeLast()
    }
}

func permute(_ nums: [Int]) {
    guard nums.count > 0 else {
        res = []
        return
    }
    
    var track = [Int]()
    backTrack(nums, &track)
}

permute([1,2,3])
print(res)


// N 皇后问题
class Solution {
    
    var res = [[String]]()
    var cols = [Int]()
    var nQueue: Int = 0
    
    func solveNQueen(_ num: Int) {
        guard num > 0 else { return }
        
        nQueue = num
        cols = [Int](repeating: 0, count: num)
        
        backtrack(row: 0)
        
        print(res)
    }
    
    func backtrack(row: Int) {
        if row == nQueue {
            var colRes = [String]()
            for row in 0..<nQueue {
                var rowString = ""
                for col in 0..<nQueue {
                    if cols[row] == col {
                        rowString.append("Q")
                    } else {
                        rowString.append(".")
                    }
                }
                colRes.append(rowString)
            }
            res.append(colRes)
            return
        }
        
        for col in 0..<nQueue {
            if isValid(row: row, column: col) {
                cols[row] = col
                backtrack(row: row + 1)
            }
        }
    }
    
    func isValid(row: Int, column: Int) -> Bool {
        for i in 0..<row {
            if cols[i] == column { return false } // 判断当前列是否存储有皇后
            if (row - i) == abs(Int(cols[i] - column)) { return false } // 对角线是否存储有皇后 对角线的斜率是1或者是-1因此用了系统的abs函数
        }
        return true
    }
}

let s = Solution()
s.solveNQueen(8)
//: [Next](@next)
