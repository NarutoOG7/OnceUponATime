//
//  Login.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/25/22.
//

import SwiftUI
import FirebaseAuth

struct Login: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var selection = 0
    @ObservedObject var authorization = Authorization.instance
    var body: some View {
        NavigationView {
            if authorization.signedIn {
                // Home
                TabView(selection: $selection) {
                    ExploreByList()
                        .tabItem {
                            Text("Explore")
                        }
                        .tag(0)
                }
            } else {
                //Sign In View
                AuthView(authType: .signIn)
            }
            
        }
        .onAppear {
            authorization.signedIn = authorization.isSignedIn
        }
    }
}

class Authorization: ObservableObject {
    static let instance = Authorization()
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Error signing in: \(error)")
            } else {
                guard result != nil else {
                    print("no results")
                    return
                }
                DispatchQueue.main.async {
                    self.signedIn = true
                }
            }
        }
    }
    
    func signUp(email: String, password: String, confirmPassword: String) {
    //Todo: confirm that password and confirm password match
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Trouble creating account \(error)")
            } else {
                guard result != nil else {
                    print("No result")
                    return
                }
                DispatchQueue.main.async {
                    self.signedIn = true
                }
            }
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
            self.signedIn = false
        } catch {
            print("Trouble siging out. \(error)")
            // handle error
        }
    }
}

struct AuthView: View {
    
    enum AuthType: String {
        case signIn = "Sign In"
        case createAccount = "Create Account"
    }
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @ObservedObject var authorization = Authorization.instance
//    @StateObject var loginData = LoginViewModel()
    
    var authType: AuthType
    
    var body: some View {
        VStack {
            TextField("Email Address", text: $email)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            SecureField("Password", text: $password)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            Button(action: {
                if authType == .signIn {
                    authorization.signIn(email: email, password: password)
                } else {
                    authorization.signUp(email: email, password: password, confirmPassword: confirmPassword)
                }
            }, label: {
                Text(authType.rawValue)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
            })
            NavigationLink("Create Account", destination:
                            AuthView(authType: .createAccount))
                .padding()
        }
        .padding()
        .navigationTitle(authType.rawValue)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
