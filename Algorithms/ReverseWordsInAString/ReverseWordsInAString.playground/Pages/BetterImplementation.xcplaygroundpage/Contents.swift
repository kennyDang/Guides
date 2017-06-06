// A better implementation
// Runtime: about 342 ms
// Beats 100 % of swift submissions

import Foundation

func reverseWords(_ s: String) -> String {
    var reversedString = ""
    var words = [String]()
    words = s.components(separatedBy: " ")
    for word in words {
        var chars = Array(word.characters)
        var j = chars.count - 1
        var i = 0
        while i < j {
            var temp = chars[i]
            chars[i] = chars[j]
            chars[j] = temp
            j -= 1
            i += 1
        }
        reversedString += " " + String(chars)
    }
    reversedString.remove(at: reversedString.startIndex)
    
    return reversedString
}

print(reverseWords("Let's take LeetCode contest"))
