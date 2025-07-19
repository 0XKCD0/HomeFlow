//
//  OrganisationLevelView.swift
//  HomeFlow
//
//  Created by Shivangi Dutta on 13/07/25.
//
import SwiftUI

struct OrganisationLevelView: View {
    @ObservedObject var viewModel: OnboardingViewModel
//    @State private var organisationLevel = "Organized"
    
    let options = [
        "Super organized", "Getting there", "A bit messy",
        "Just starting out"
    ]
    
    var finish: () -> Void
    var back: () -> Void
    
    var body: some View {
        ZStack {
            Color(red: 248/255, green: 243/255, blue: 217/255).ignoresSafeArea()
            
            VStack (alignment: .leading, spacing: 24) {
                Text("How organized are you feeling right now?")
                    .font(.title2).bold()
                    .padding(.top)
                
                ForEach(options, id: \.self) { options in
                    HStack {
                        Text(options)
                            .font(.headline)
                        Spacer()
                        Image(systemName: viewModel.organisationLevel.contains(options) ? "checkmark.square.fill" : "square")
                            .foregroundStyle(Color(red: 80/255, green: 75/255, blue: 56/255))
                            .imageScale(.large)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(viewModel.organisationLevel.contains(options) ? Color(red: 185/255, green: 178/255, blue: 138/255) : Color(red: 235/255, green: 229/255, blue: 194/255))
                            .shadow(color: Color.black.opacity(0.5), radius: 3, x: 0, y: 2))
                    .onTapGesture {
                        viewModel.organisationLevel = options
                    }
                }
                Spacer()
                
                HStack {
                                   Button("Back", action: back)
                                   Spacer()
                                   Button("Finish", action: finish)
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
    OrganisationLevelView(viewModel: OnboardingViewModel(), finish: {}, back: {})
}


