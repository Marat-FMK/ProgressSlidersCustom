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
        ZStack {
            Image(viewModel.screenInfo[viewModel.currentSlide]["image"] ?? "pic1")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                progressView
                
                Spacer()
                
                VStack {
                    ItemTextView(title: viewModel.screenInfo[viewModel.currentSlide]["title"] ?? "", description: viewModel.screenInfo[viewModel.currentSlide]["text"] ?? "")
                    
                    Button {
                        viewModel.goNext()
                    } label: {
                        Text("next slide")
                            .font(.system(size: 40))
                    }
                    .buttonStyle(.glass)
                    .padding(.vertical, 30)
                }
                .frame(maxWidth: .infinity)
                .background {
                    Rectangle()
                        .foregroundStyle(Gradient(colors: [.clear, .black.opacity(0.9)]))
                }
            }
            .padding(.top, 70)
            .ignoresSafeArea()
        }
    }
}

extension OnboardingView {
    var progressView: some View {
        
        HStack {
            ForEach(viewModel.screenInfo.indices, id: \.self) { slide in
                GeometryReader { proxy in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(.gray)
                        if slide < viewModel.currentSlide {
                            Capsule()
                                .fill(.black)
                                .frame(width: proxy.size.width)
                        } else if slide == viewModel.currentSlide {
                            Capsule()
                                .fill(.black)
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
        .frame(height: 5)
        .padding(.horizontal, 20)
        .onAppear {
            viewModel.startProgress()
        }
    }
}

#Preview {
    OnboardingView()
}
