//
//  SwiftUIFormRegistrationView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/20.
//

import SwiftUI
import Combine

struct SwiftUIFormRegistrationView: View {
    
    @ObservedObject private var userRegistationViewModel = UserRegisterationViewModel()
    
    var body: some View {
        VStack {
            Text("Create an account")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 30)
            FormFieldRegister(fieldName:  "Username" ,fieldValue: $userRegistationViewModel.username)
            RequirementTextRegister(iconColor: userRegistationViewModel.isUsernameLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255) ,text: "A minimum of 4 characters")
                .padding()
            FormFieldRegister(fieldName: "Password", fieldValue: $userRegistationViewModel.password, isSecure: true)
            VStack {
                RequirementTextRegister(iconName: "lock.open", iconColor: userRegistationViewModel.isPasswordLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text: "A minimum of 8 characters", isStrikeThrough: userRegistationViewModel.isPasswordLengthValid)
                RequirementTextRegister(iconName: "lock.open", iconColor: userRegistationViewModel.isPasswordCapitalLetter ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text: "One uppercase letter", isStrikeThrough: false)
            }
            .padding()
            FormFieldRegister(fieldName: "Confirm Password", fieldValue: $userRegistationViewModel.passwordConfirm, isSecure: true)
            RequirementTextRegister(iconColor: userRegistationViewModel.isPasswordConfirmValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),text: "Your confirm password should be the same as the password", isStrikeThrough: userRegistationViewModel.isPasswordConfirmValid)
                .padding()
                .padding(.bottom, 50)
            Button {
                
            } label: {
                Text("Sign Up")
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.white)
                    .bold()
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("Already have an account?")
                    .font(.system(.body, design: .rounded))
                    .bold()
                Button {
                    
                } label: {
                    Text("Sign in")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundStyle(Color(red: 251/255, green: 128/255, blue: 128/255))
                }
            }
            .padding(.top, 50)
            
            Spacer()
        }
        .padding()
    }
}

struct RequirementTextRegister: View {
    var iconName = "xmark.square"
    var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    var text = ""
    var isStrikeThrough = false
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.secondary)
                .strikethrough(isStrikeThrough)
            Spacer()
        }
    }
}

struct FormFieldRegister: View {
    var fieldName = ""
    @Binding var fieldValue: String
    var isSecure = false
    var body: some View {
        VStack {
            if isSecure {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            } else {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)
        }
    }
}

#Preview {
    SwiftUIFormRegistrationView()
}
