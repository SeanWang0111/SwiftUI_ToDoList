//
//  Encodable.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/24.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data: Data = try? JSONEncoder().encode(self) else { return [:] }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch { return [:] }
    }
}
