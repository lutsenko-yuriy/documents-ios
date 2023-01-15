//
//  EmojiArtModel.swift
//  EmojiArt
//
//  Created by Yuriy Lutsenko on 15.01.23.
//

import Foundation

struct EmojiArtModel {
    var background = Background.blank
    var emojis = [Emoji]()
    
    struct Emoji: Identifiable, Hashable {
        let text: String
        var x: Int // Offset from the center
        var y: Int // Offset from the center
        var size: Int
        let id: Int
        
        fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int) {
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = id
        }
    }
    
    init() { }
    
    private var latestEmojiId = 0
    
    mutating func add(emoji text: String, at location: (x: Int, y: Int), size: Int) {
        latestEmojiId += 1
        emojis.append(Emoji(text: text, x: location.x, y: location.y, size: size, id: latestEmojiId))
    }
    
}
