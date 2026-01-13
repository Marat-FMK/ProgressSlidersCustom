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
    let image: String
    
    static let example = [OnboardingItem(title: "Hello", description: "приветствую нового юзера", image: "pic1"),
                          OnboardingItem(title: "Navigation", description: "у нас классная навигация", image: "pic2"),
                          OnboardingItem(title: "Security", description: "мы думаем о твоей безопасности", image: "pic3"),
                          OnboardingItem(title: "Search", description: "написали поиск для запросов", image: "pic4")
    ]
}

//
