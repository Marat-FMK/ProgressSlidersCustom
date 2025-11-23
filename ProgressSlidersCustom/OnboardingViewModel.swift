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
    
    let items: [OnboardingItem] = []
    @Published var currentSlide = 0
    @Published var progress: CGFloat = 0
    @Published var timerTask: DispatchWorkItem?
    
    
}
