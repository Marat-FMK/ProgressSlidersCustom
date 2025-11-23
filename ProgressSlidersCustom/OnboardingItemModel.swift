//
//  OnboardingItemModel.swift
//  ProgressSlidersCustom
//
//  Created by Marat Fakhrizhanov on 23.11.2025.
//

import Foundation

struct OnboardingItem: Identifiable {
    let id: UUID = UUID()
    let title: String
    let description: String
}
