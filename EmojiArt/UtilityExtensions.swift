//
//  UtilityExtensions.swift
//  EmojiArt
//
//  Created by Yuriy Lutsenko on 15.01.23.
//

import Foundation

extension Collection where Element: Identifiable {
    func index(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
}

extension RangeReplaceableCollection where Element: Identifiable {
    mutating func remove(_ element: Element) {
        if let index = index(matching: element) {
            remove(at: index)
        }
    }
}
