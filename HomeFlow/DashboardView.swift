//
//  DashboardView.swift
//  HomeFlow
//
//  Created by Shivangi Dutta on 13/07/25.
//
import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 248/255, green: 243/255, blue: 217/255).ignoresSafeArea()
                VStack(spacing: 24) {
                    HStack {
                        Spacer()
                        Text("Home Organizer")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 80/255, green: 75/255, blue: 56/255))
                            .shadow(radius: 3)
                        Spacer()
                    }
                    Text("Simple Inventory, Smart Storage")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .foregroundColor(Color(red: 80/255, green: 75/255, blue: 56/255))
                        .shadow(radius: 1)
                    
                    HStack {
                        TextField("Search any stuff here", text: .constant(""))
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color(red: 235/255, green: 229/255, blue: 194/255))
                            .cornerRadius(10)
                            .opacity(0.8)
                        
                        Image(systemName: "magnifyingglass")
                            .padding(.horizontal, 10)
                            .foregroundColor(Color(red: 80/255, green: 75/255, blue: 56/255))
                            .shadow(radius: 3)
                    }
                    .padding(.horizontal)
                    
                    HStack(spacing: 16){
                        VStack(alignment: .leading, spacing: 8) {
                            Label("Dashboard", systemImage: "chart.bar.xaxis")
                                .font(.headline)
                                .foregroundColor(Color(red: 80/255, green: 75/255, blue: 56/255))
                            
                            Text("Track All in One Dashboard")
                                .font(.caption)
                                .foregroundColor(Color(red: 80/255, green: 75/255, blue: 56/255))
                                
                            HStack {
                                Text("Total stuff")
                                    .foregroundColor(Color(red: 80/255, green: 75/255, blue: 56/255))
                                Spacer()
//                                Text("\(totalStuff)")
                            }
                            
                            HStack {
                                Text("Total Price")
                                    .foregroundColor(Color(red: 80/255, green: 75/255, blue: 56/255))
                                Spacer()
                                
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 235/255, green: 229/255, blue: 194/255))
                        .cornerRadius(12)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Label("My Stuff", systemImage: "shippingbox")
                                .font(.headline)
                                .foregroundColor(Color(red: 80/255, green: 75/255, blue: 56/255))
                            Text("Filter all your stuff")
                                .font(.caption)
                                .foregroundColor(Color(red: 80/255, green: 75/255, blue: 56/255))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 235/255, green: 229/255, blue: 194/255))
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    NavigationLink(destination: AddStuffView()) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add Stuff")
                                .fontWeight(.semibold)
                                .shadow(radius: 2)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 185/255, green: 178/255, blue: 138/255))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                }
                .padding(.top)
                
            }

        }
    }
}


#Preview {
    DashboardView()
}
