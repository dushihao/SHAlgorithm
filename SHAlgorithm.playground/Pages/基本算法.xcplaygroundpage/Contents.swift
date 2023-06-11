//import UIKit

/// 基本排序

// 冒泡排序
func bubbleSort(_ nums: inout [Int]) {
        let n = nums.count
        for i in 0..<n {
            for j in 0..<(n - 1 - i) {
                if nums[j] > nums[j + 1] {
                    nums.swapAt(j, j + 1)
                }
            }
        }
    }


// 冒泡排序优化
func bubbleSort1(_ nums: inout [Int]) {
    guard nums.count > 1 else { return }
       
       for i in 0 ..< nums.count-1 {
           var exchanged = false
           for j in 0 ..< nums.count-1-i {
               if nums[j] > nums[j+1] {
                   nums.swapAt(j, j+1)
                   exchanged = true
               }
           }
           
           if !exchanged { break }
       }
}

var array = [3,2,1,5,6,4]
bubbleSort1(&array)


// 快速排序
func quickSort<T: Comparable>(_ nums:[T]) -> [T] {
    guard nums.count > 1 else { return nums }
    
    let pivot = nums[nums.count / 2]
    let left = nums.filter{ $0 < pivot }
    let center = nums.filter{ $0 == pivot }
    let right = nums.filter{ $0 > pivot}
    
    return quickSort(left) + center + quickSort(right)
}

let unsortedNums = [3,2,1,5,6,4,8,6,5,4,9,188]
let sortedNums = quickSort(unsortedNums)


// 选择排序
func selectionSort<T: Comparable>(_ nums: inout [T]) {
    guard nums.count > 1 else { return }
    
    for i in 0..<nums.count {
        var minIndex = i
        for j in i+1..<nums.count {
            if nums[j] < nums[minIndex] {
                minIndex = j
            }
        }
        
        if minIndex != i {
            nums.swapAt(i, minIndex)
        }
    }
}

var unsortedNums3 = [3,2,1,5,6,4,8,6,5,4,9,188]
selectionSort(&unsortedNums3)
