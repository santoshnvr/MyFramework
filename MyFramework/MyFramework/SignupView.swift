//
//  SignupView.swift
//  MyFramework
//
//  Created by Santosh Kumar on 4/21/23.
//

import SwiftUI

public struct SignupView: View {
    @ObservedObject var signupVM = SignupViewModel()
    @State private var showState = false
    @State var name: String = ""
    
    public init(signupVM: SignupViewModel = SignupViewModel(), showState: Bool = false, name: String) {
        self.signupVM = signupVM
        self.showState = showState
        self.name = name
    }


   public var body: some View {
        VStack(alignment: .leading) {
            Text("Register").font(.subheadline)
            CustomTextField(sfSymbolName: "envelope", placeHolder: "Email Address", prompt: signupVM.emailPrompt, field: $signupVM.email, isSecure: false)
            CustomTextField(sfSymbolName: "lock", placeHolder: "Password", prompt: signupVM.passwordPrompt, field: $signupVM.password, isSecure: true)
            CustomTextField(sfSymbolName: "lock", placeHolder: "Confirm", prompt: signupVM.confirmPwPrompt, field: $signupVM.confirmPW, isSecure: true)
            
            
            
            VStack {
                Button {
                    print("do login action")
                } label: {
                    Text("LET'S GO")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.black)
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background( signupVM.isSignUpComplete ? .green : .gray)
                .cornerRadius(20)
                .opacity(signupVM.isSignUpComplete ? 1 : 0.6)
                .disabled(!signupVM.isSignUpComplete)
                
                Text("We'll send one-time verification code via SMS to confirm your mobile number. Message and data rates may apply")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(.gray)
            }
            
            Button {
                showState.toggle()
            } label: {
                Text("OTHER SIGN IN OPTIONS")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.green)
                    .frame(height: 40)
            }
            .sheet(isPresented: $showState) {
                Button {
                    print("Facebook action")
                } label: {
                    Text("Facebook")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.black)
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(.green)
                .cornerRadius(20)
                
                Button {
                    print("Twitter action")
                } label: {
                    Text("Twitter")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.black)
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(.green)
                .cornerRadius(20)
            
                .presentationDetents([.large, .medium, .fraction(0.75)])
            }
            .padding()
            
        }.padding()
    }
}
