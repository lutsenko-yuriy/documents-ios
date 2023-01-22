//
//  UtilityViews.swift
//  EmojiArt
//
//  Created by Yuriy Lutsenko on 22.01.23.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        if let uiImage {
            Image(uiImage: uiImage)
        }
    }
}
