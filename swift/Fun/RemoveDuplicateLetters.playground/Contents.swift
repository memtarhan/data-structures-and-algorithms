import Foundation

func removeDuplicateCharacters(in string: String) -> String {
    var used = Set<Character>()
    
    return string.filter {
        used.insert($0).inserted
    }
}

removeDuplicateCharacters(in: "Mississippi")
