//
//  ItemTextView.swift
//  ProgressSlidersCustom
//
//  Created by Marat Fakhrizhanov on 24.11.2025.
//

import SwiftUI

struct ItemTextView: View {
    let title: String
    let description: String
    
    var body: some View {

        VStack (alignment: .leading, spacing: 20) {
            Text(title)
                .font(.system(size: 40))
                .foregroundStyle(.white)
                .lineLimit(1)
            
            Text(description)
                .font(.system(size: 25))
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
