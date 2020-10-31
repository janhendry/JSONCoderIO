//
//  File.swift
//  
//
//  Created by Jan Anstipp on 31.10.20.
//

extension Array where Element == CodingKey {
    func path() -> String {
        self.map{$0.stringValue}.joined(separator: ".")
    }
    func path() -> [String] {
        self.map{$0.stringValue}
    }
    func appending(key:CodingKey) -> [CodingKey] {
        var keys = map{$0}
        keys.append(key)
        return keys
    }
}

extension Array where Element == String {
    func path() -> String {
        self.map{$0}.joined(separator: ".")
    }
}


protocol OptionalProtocol {
    func isSome() -> Bool
    func unwrap() -> Any
}

extension Optional : OptionalProtocol {
    func isSome() -> Bool {
        switch self {
        case .none: return false
        case .some: return true
        }
    }

    func unwrap() -> Any {
        switch self {
        case .none: preconditionFailure("trying to unwrap nil")
        case .some(let unwrapped): return unwrapped
        }
    }
    func unwrap<T>(type:T) -> T {
        switch self {
        case .none: preconditionFailure("trying to unwrap nil")
        case .some(let unwrapped): return unwrapped as! T
        }
    }
}

