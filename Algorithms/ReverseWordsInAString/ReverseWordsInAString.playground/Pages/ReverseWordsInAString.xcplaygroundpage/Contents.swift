import Foundation

// Brute Force

// This algorithm will reverse every word in a String
// while preserving whitespace and initial word order

// Runtime: About 538 ms
// Time Complexity: O(n)
// This beats 76.56 % of other submissions on leetcode
// https://leetcode.com/submissions/detail/104951380/

func reverseWords(_ s: String) -> String {
    var reversedString = ""
    var words = [String]()
    
    words = s.components(separatedBy: " ")
    
    for word in words {
        reversedString += reverseWord(word) + " "
    }
    
    let index = reversedString.index(before: reversedString.endIndex)
    
    if reversedString[index] == " " {
        reversedString.characters.removeLast()
    }
    
    return reversedString
}

func reverseWord(_ w: String) -> String {
    var temp = ""
    
    for char in w.characters.reversed() {
        temp.append(char)
    }
    
    return temp
}

print(reverseWords("Let's take LeetCode contest"))
