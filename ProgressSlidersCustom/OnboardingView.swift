//
//  ContentView.swift
//  ProgressSlidersCustom
//
//  Created by Marat Fakhrizhanov on 23.11.2025.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            Image(viewModel.items[viewModel.currentSlide].image)
                .resizable()
            
            VStack(alignment: .leading) {
                
                ProgressSlidersView(progress: $viewModel.progress, currentSlide: $viewModel.currentSlide, items: viewModel.items, startProgress: viewModel.startProgress)
                    .padding(.top, 70)
                
                Spacer()
                
                VStack(spacing: 30) {
                    HStack {
                        ItemTextView(title: viewModel.items[viewModel.currentSlide].title, description: viewModel.items[viewModel.currentSlide].description)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Button {
                            viewModel.goNext()
                        } label: {
                            Text("next slide")
                                .font(.system(size: 40))
                        }
                        .buttonStyle(.glass)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 70)
                .background {
                    Rectangle()
                        .foregroundStyle(Gradient(colors: [.clear, .black.opacity(0.7)]))
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}



