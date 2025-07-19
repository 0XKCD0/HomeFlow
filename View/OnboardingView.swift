//
//  OnboardingView.swift
//  HomeFlow
//
//  Created by Shivangi Dutta on 13/07/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep = 0
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack {
            if currentStep == 0 {
                StuffCategoryView(viewModel: viewModel, next: { currentStep += 1 })
            } else if currentStep == 1 {
                PriceTrackingView(viewModel: viewModel, next: { currentStep += 1 }, back: { currentStep -= 1 })
            } else if currentStep == 2 {
                ExpiryTrackingView(viewModel: viewModel, next: { currentStep += 1 }, back: { currentStep -= 1 })
            } else if currentStep == 3 {
                OrganisationLevelView(viewModel: viewModel, finish: { currentStep += 1 }, back: { currentStep -= 1 })
            } else {
                DashboardView()
            }
        }
    }
}


#Preview {
    OnboardingView()
}
