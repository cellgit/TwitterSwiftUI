//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by パクギョンソク on 2023/09/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel
    @State private var email = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode

    init() {
        _viewModel = .init(wrappedValue: LoginViewModel())
    }

    var body: some View {
        
        NavigationStack {
            VStack {
                // HeaderView
                AuthHeaderView(title1: "Hello.", title2: "Welcome Back.")
                
                VStack(spacing: 40) {
                    CustomTextField(imageName: "envelope", placeholdeer: "Email", text: $email)
                    CustomTextField(imageName: "lock",
                                    placeholdeer: "Password",
                                    isSecureField: true,
                                    text: $password)
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        Text("Reset Password View")
                    } label: {
                        Text("Forgot Password")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                            .padding(.top)
                            .padding(.trailing, 24)
                    }
                }
                
                AuthSubmitButton(title: "Sign In", width: 340) {
                    viewModel.login(withEmail: email, password: password)
                }
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.footnote)
                        
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .foregroundColor(Color(.systemBlue))
                .padding(.bottom, 32)
            }
            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    LoginView()
}
 
