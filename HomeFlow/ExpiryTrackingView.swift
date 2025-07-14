//
//  ExpiryTrackingView.swift
//  HomeFlow
//
//  Created by Shivangi Dutta on 13/07/25.
//
import SwiftUI

struct ExpiryTrackingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
//    @State private var selectedExpiry = "Expired"
    
    let options = [
        "Yes, please",
        "No, please"
    ]
    
    var next: () -> Void
    var back: () -> Void
    

    
    var body: some View {
        ZStack {
            Color(red: 248/255, green: 243/255, blue: 217/255).ignoresSafeArea()
            
            VStack (alignment: .leading, spacing: 24) {
                Text("Would you like to track item expiry dates?")
                    .font(.title2).bold()
                    .padding(.top)
                
                ForEach(options, id: \.self) { options in
                    HStack {
                        Text(options)
                            .font(.headline)
                        Spacer()
                        Image(systemName: viewModel.selectedExpiry.contains(options) ? "checkmark.square.fill" : "square")
                            .foregroundStyle(Color(red: 80/255, green: 75/255, blue: 56/255))
                            .imageScale(.large)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(viewModel.selectedExpiry.contains(options) ? Color(red: 185/255, green: 178/255, blue: 138/255) : Color(red: 235/255, green: 229/255, blue: 194/255))
                            .shadow(color: Color.black.opacity(0.5), radius: 3, x: 0, y: 2))
                    .onTapGesture {
                        viewModel.selectedExpiry = options
                    }
                }
                Spacer()
                
                HStack {
                                   Button("Back", action: back)
                                   Spacer()
                                   Button("Next", action: next)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 80/255, green: 75/255, blue: 56/255))
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                
            }
            .padding()
            
        }
        
    }
}

#Preview {
    ExpiryTrackingView(viewModel: OnboardingViewModel(), next: {}, back: {})
}
