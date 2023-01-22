//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Yuriy Lutsenko on 15.01.23.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
    
    @Published private(set) var emojiArt: EmojiArtModel {
        didSet {
            if emojiArt.background != oldValue.background {
                fetchBackgroundImageDataIfNecessary()
            }
        }
    }
    
    init() {
        emojiArt = EmojiArtModel()
        emojiArt.add(emoji: "A", at: (-200, -200), size: 80)
        emojiArt.add(emoji: "B", at: (50, 100), size: 40)
    }
    
    var emojis: [EmojiArtModel.Emoji] {
        emojiArt.emojis
    }
    
    var background: EmojiArtModel.Background {
        emojiArt.background
    }
    
    @Published var backgroundImage: UIImage?
    
    private func fetchBackgroundImageDataIfNecessary() {
        backgroundImage = nil
        switch emojiArt.background {
        case .url(let url):
            DispatchQueue.global(qos: .userInitiated).async {
                let imageData = try? Data(contentsOf: url)
                if let imageData {
                    self.backgroundImage = UIImage(data: imageData)
                }
            }
        case .imageData(let data):
            backgroundImage = UIImage(data: data)
        case .blank:
            break
        }
    }

    func setBackground(_ background: EmojiArtModel.Background) {
        emojiArt.background = background
        print("Background set to \(background)")
    }
    
    func add(emoji: String, at location: (x: Int, y: Int), size: CGFloat) {
        emojiArt.add(emoji: emoji, at: location, size: Int(size))
    }
    
    func move(emoji: EmojiArtModel.Emoji, by offset: CGSize) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            emojiArt.emojis[index].x += Int(offset.width)
            emojiArt.emojis[index].y += Int(offset.height)
        }
    }
    
    func scale(emoji: EmojiArtModel.Emoji, by scale: CGFloat) {
        if let index = emojiArt.emojis.firstIndex(of: emoji) {
            emojiArt.emojis[index].size = Int((CGFloat(emojiArt.emojis[index].size) * scale).rounded(.toNearestOrAwayFromZero))
        }
    }
    
}
