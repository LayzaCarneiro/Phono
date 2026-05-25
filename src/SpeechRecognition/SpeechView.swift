//
//  SpeechView.swift
//  Speeches
//
//  Created by Layza Maria Rodrigues Carneiro on 11/12/24.
//

import SwiftUI

struct SpeechRecognitionView: View {
    @ObservedObject var viewModel: SpeechRecognitionViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.recognizedText)
                .font(.body)
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal)
            
            Spacer()
            
            Button {
                if viewModel.isRecognizing {
                    viewModel.stopRecognition()
                } else {
                    viewModel.startRecognition()
                }
            } label: {
                Text(viewModel.isRecognizing ? "Stop" : "Try tongue twister")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [viewModel.isRecognizing ? Color("lightYellow") : Color("lightYellow"), viewModel.isRecognizing ? Color("lightYellow") : Color(("darkYellow"))]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .scaleEffect(viewModel.isRecognizing ? 1.05 : 1.0)
                    .animation(.spring(), value: viewModel.isRecognizing)
            }
            .padding(.horizontal)
        }
        .onAppear {
            viewModel.requestPermissions()
        }
        .padding(.top, 20)
    }
}
