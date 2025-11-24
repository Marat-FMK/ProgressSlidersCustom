//
//  ItemTextView.swift
//  ProgressSlidersCustom
//
//  Created by Marat Fakhrizhanov on 24.11.2025.
//

import Foundation
import SwiftUI

struct ItemTextView {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
        Text(title)
            .font(.largeTitle)
        
        Text(description)
            .font(.default)
    }
}
