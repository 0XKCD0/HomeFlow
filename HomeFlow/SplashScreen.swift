//
//  SplashScreen.swift
//  HomeFlow
//
//  Created by Shivangi Dutta on 13/07/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var animateLeftText = false
    @State private var animateRightText = false
    
    var body: some View {
        
        ZStack {
            Color(red: 248/255, green: 243/255, blue: 217/255).ignoresSafeArea()
            
            HStack {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 80/255, green: 75/255, blue: 56/255))
                    .shadow(radius: 3)
                    .offset(x: animateLeftText ? 0: -UIScreen.main.bounds.width)
                    .animation(.easeOut(duration: 1.0), value: animateLeftText)
                
                Text("Flow")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 80/255, green: 75/255, blue: 56/255))
                    .shadow(radius: 3)
                    .offset(x: animateRightText ? 0: UIScreen.main.bounds.width)
                    .animation(.easeOut(duration: 1.0), value: animateRightText)
            }
            
            VStack {
                Spacer()
                Text("Version: 1.0.0")
                    .font(.caption)
                    .foregroundStyle(Color(red: 80/255, green: 75/255, blue: 56/255))
            }
            
            
        }
        .onAppear {
            animateLeftText = true
            animateRightText = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isActive = true
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            OnboardingView()
            
        }
    }
}

#Preview {
    SplashScreen()
}
