//: [Previous](@previous)

import Foundation

// 实现一个单链表
class ListNode {
    var value: Int
    var next: ListNode?
    
    init(_ value: Int, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        if let next = next {
            return "\(value) -> \(next)"
        } else {
            return "\(value)"
        }
    }
}


class Solution {
    // 合并两个有序列表
    
    /// 递归
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else { return list2 }
        guard let list2 = list2 else { return list1 }
        
        if list1.value < list2.value {
            list1.next = mergeTwoLists(list1.next, list2)
            return list1
        } else {
            list2.next = mergeTwoLists(list2.next, list1)
            return list2
        }
    }
    
    /// 迭代
    func mergeTwoListMethod2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        var list1 = list1
        var list2 = list2
        
        let preNode = ListNode(-1)
        var head: ListNode? = preNode
        
        while list1 != nil {
            while list2 != nil, list2?.value ?? 0 < list1?.value ?? 0 {
                head?.next = list2
                head = head?.next
                list2 = list2?.next
            }
            
            head?.next = list1
            head = head?.next
            list1 = list1?.next
        }
        
        head?.next = list1 ?? list2
        return preNode.next
    }
    
}

let s = Solution()
let list1 = ListNode(1, next: .init(3, next: .init(5, next: nil)))
let list2 = ListNode(1, next: .init(2, next: .init(4, next: nil)))

let r = s.mergeTwoLists(list1, list2)


let r1 = s.mergeTwoListMethod2(list1, list2)
//: [Next](@next)
