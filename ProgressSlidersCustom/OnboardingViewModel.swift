//
//  OnboardingViewModel.swift
//  ProgressSlidersCustom
//
//  Created by Marat Fakhrizhanov on 23.11.2025.
//

import SwiftUI
import Combine


// // // // // // ErrorNil example

class OnboardingViewModel: ObservableObject {
    
    @Published var currentSlide = 0
    @Published var progress: CGFloat = 0
    @Published var timerTask: DispatchWorkItem?
    
    let items: [OnboardingItem] = OnboardingItem.example
    
    func startProgress() {
        timerTask?.cancel()
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
        timerTask?.cancel()
        if currentSlide < items.count-1 {
            currentSlide += 1
            startProgress()
        } else {
            print("complete onboarding")
        }
    }
}

// //
