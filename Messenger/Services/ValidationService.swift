//
//  ValidationService.swift
//  Messenger
//
//  Created by Igor Manakov on 07.10.2022.
//

import Foundation

final class ValidationService {
    
    enum FieldType: String {
        case email = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        case password = #"(?=.{8,})"# // (?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[ !$%&?._-])
        case onlyLetters = #"^[A-Za-z]+$"#
        case onlyNumbers = #"^[0-9]"#
    }
    
    // MARK: - Public
    
    func isValid(_ str: String, type: FieldType) -> Bool {
        let pattern = type.rawValue
        
        guard let gRegex = try? NSRegularExpression(pattern: pattern) else {
            return false
        }
        
        let range = NSRange(location: 0, length: str.utf16.count)
        
        if gRegex.firstMatch(in: str, options: [], range: range) != nil {
            return true
        }
        
        return false
    }
    
    // MARK: - Private
}
