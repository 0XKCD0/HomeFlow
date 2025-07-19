//
// LoginScreenView.swift
//  HomeFlow
//
//  Created by Shivangi Dutta on 17/07/25.
//
import SwiftUI
import Firebase
import FirebaseAuth

struct LoginScreenView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var userIsLoggedIn = false
    @State private var showPassword = false
    @State private var passwordError: String = ""
    
    var body: some View {
        if userIsLoggedIn {
            //go onboardingViews
            OnboardingView()
            
        } else {
            content
        }
    
    }
    
    var content: some View {
        ZStack {
            Color(red: 248/255, green: 243/255, blue: 217/255).ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.brown, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(122))
                .offset(y: -350)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                    .frame(width: 380, height: 190)
                    .shadow(radius: 10)
                    .padding(.bottom, 70)
                
                VStack(spacing: 20) {
                    Text("Welcome to HomeFlow")
                        .foregroundColor(Color(red: 80/255, green: 75/255, blue: 56/255))
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .shadow(radius: 2)
                        .offset(y: -110)
                    
                    TextField("Email", text: $email)
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .placeholder(when: email.isEmpty) {
                            Text("")
                                .foregroundColor(.brown)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.brown)
                    
                    HStack {
                        Group {
                            if showPassword {
                                TextField("Password", text: $password)
                            } else {
                                SecureField("Password", text: $password)
                            }
                        }
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
                        .placeholder(when: password.isEmpty) {
                            Text("")
                                .foregroundColor(.brown)
                                .bold()
                        }

                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }

                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.brown)
                    
                    if !passwordError.isEmpty {
                        Text(passwordError)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.top, 2)
                    }
                    
                    Button {
                        //sign up
                        if isPasswordValid() {
                            password = ""
                            register()
                        } else {
                            print("Password must be at least 12 characters long.")
                        }
                    } label: {
                        Text("Sign up")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.brown, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                            )
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                    .offset(y: 150)
                    
                    Button {
                        //log in
                        login()
                    } label : {
                        Text("Already have an account? Log in")
                            .bold()
                            .foregroundColor(.blue)
                        
                    }
                    .padding(.top)
                    .offset(y: 150)
                    
                    
                }
                .frame(width: 350)
                .onChange(of: password, initial: false) { oldValue, newValue  in
                    passwordError = isPasswordValid() ? "" : "Password must be at least 12 characters long."
                }
                .onAppear {
                    try? Auth.auth().signOut()
                    userIsLoggedIn = false // Force to show login every time app launches can remove later
                    _ = Auth.auth().addStateDidChangeListener { auth, user in
//                        if user != nil {
//                            userIsLoggedIn.toggle()
//                        }
                        userIsLoggedIn = user != nil
                    }
                }
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { resullt, error in
            if let error = error {
                        print("Login failed: \(error.localizedDescription)")
                    } else {
                        print("Login successful")
                        userIsLoggedIn = true
                    }
            
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Registration failed: \(error.localizedDescription)")
            } else {
                print("Registration successful")
                            userIsLoggedIn = true
            }
        }
    }
    
    func isPasswordValid() -> Bool {
        return password.count >= 12
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
            
        }
}

#Preview {
    LoginScreenView()
}

