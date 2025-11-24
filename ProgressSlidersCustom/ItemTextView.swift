//
//  ItemTextView.swift
//  ProgressSlidersCustom
//
//  Created by Marat Fakhrizhanov on 24.11.2025.
//

import SwiftUI

struct ItemTextView {
    let title: String
    let description: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text(title)
                .font(.largeTitle)
                .foregroundStyle(.black)
            
            Text(description)
                .font(.default)
                .foregroundStyle(.gray)
        }
    }
}
