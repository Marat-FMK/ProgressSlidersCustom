//
//  ContentView.swift
//  ProgressSlidersCustom
//
//  Created by Marat Fakhrizhanov on 23.11.2025.
//

import SwiftUI
import Combine

struct OnboardingView: View {
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack {
            HStack {
                progressView
            }
            .onAppear {
                viewModel.startProgress()
            }
            VStack(alignment: .leading) {
                Text(viewModel.screenInfo[viewModel.currentSlide]["title"] ?? "")
                    .font(.title)
                
                Text(viewModel.screenInfo[viewModel.currentSlide]["text"] ?? "")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Spacer()
            
            Button {
                viewModel.goNext()
            } label: {
                Text("next")
            }
        }
        .padding()
    }
}

extension OnboardingView {
    var progressView: some View {
        
        ForEach(viewModel.screenInfo.indices, id: \.self) { slide in
            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(.gray)
                        .frame(height: 5)
                    if slide < viewModel.currentSlide {
                        Capsule()
                            .fill(.black)
                            .frame(height: 5)
                            .frame(width: proxy.size.width)
                    } else if slide == viewModel.currentSlide {
                        Capsule()
                            .fill(.black)
                            .frame(height: 5)
                            .frame(width: proxy.size.width * self.viewModel.progress, alignment: .leading)
                    }
                }
                .onTapGesture {
                    viewModel.currentSlide = slide
                    viewModel.startProgress()
                }
            }
        }
        
    }
}

#Preview {
    OnboardingView()
}
