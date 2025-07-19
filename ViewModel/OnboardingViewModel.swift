//
//  OnboardingViewModel.swift
//  HomeFlow
//
//  Created by Shivangi Dutta on 14/07/25.
//
import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var selectedOptions : Set<String> = []
    @Published var selectedPrice: String = ""
    @Published var selectedExpiry: String = ""
    @Published var organisationLevel: String = ""
}
