//
//  OnboardingViewModel.swift
//  ProgressSlidersCustom
//
//  Created by Marat Fakhrizhanov on 23.11.2025.
//

import SwiftUI
import Combine

@Observable
class OnboardingViewModel {
    
    let items: [OnboardingItem] = OnboardingItem.example
    
    @Published var currentSlide = 0
    @Published var progress: CGFloat = 0
    @Published var timerTask: DispatchWorkItem?
    
    func startProgress() {
        progress = 0
        withAnimation(.linear(duration: 3)) {
            progress = 1
        }
        
        timerTask = DispatchWorkItem(block: {
            self.goNext()
        })
        
        guard let timerTask else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: timerTask)
    }
    
    func goNext() {
        if currentSlide < items.count-1 {
            currentSlide += 1
            startProgress()
        } else {
            print("complete onboarding")
        }
    }
    
}
