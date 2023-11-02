//
//  ContentView.swift
//  LoginScreen
//
//  Created by Dallas Gere on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color .indigo
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(Color.secondary.opacity(0.7))
                
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login"){
                        // authenticate user
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 35)
                    .background(.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("You are logged in @\(username)").navigationBarBackButtonHidden(true), isActive: $showingLoginScreen){
                        EmptyView()
                            .toolbarRole(.editor)

                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func authenticateUser(username: String, password: String){
        if username.lowercased() == "dallas"{
            wrongUsername = 0
            if password.lowercased() == "password"{
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

#Preview {
    ContentView()
}
