//
//  ProgressSlider.swift
//  ProgressSlidersCustom
//
//  Created by Marat Fakhrizhanov on 24.11.2025.
//

import SwiftUI

struct ProgressSlidersView: View {
    
    @Binding var progress: CGFloat
    @Binding var currentSlide: Int
    let items: [OnboardingItem]
    
    let startProgress: () -> Void
    
    var body: some View {
        
        HStack {
            ForEach(items.indices, id: \.self) { slide in
                GeometryReader { proxy in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(.gray)
                        if slide < currentSlide {
                            Capsule()
                                .fill(.black)
                                .frame(width: proxy.size.width)
                        } else if slide == currentSlide {
                            Capsule()
                                .fill(.black)
                                .frame(width: proxy.size.width * self.progress, alignment: .leading)
                        }
                    }
                    .onTapGesture {
                        currentSlide = slide
                        startProgress()
                    }
                }
            }
        }
        .frame(height: 5)
        .padding(.horizontal, 20)
        .onAppear {
            startProgress()
        }
    }
}
//
