//
//  UserProfile.swift
//  The Best Map
//
//  Created by User on 25.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

class MainMessagesViewModel: ObservableObject {

    @Published var errorMessage = ""
    @Published var chatUser: ChatUser?

    init() {
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
        }
        
        fetchCurrentUser()
        
    }
    
    func fetchCurrentUser() {

        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }

        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }

            guard let data = snapshot?.data() else {
                self.errorMessage = "No data found"
                return

            }
            self.chatUser = .init(data: data)
        }
    }
    
    @Published var isUserCurrentlyLoggedOut = false

//    init() {
//        DispatchQueue.main.async {
//            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
//            }
//    }
    
    func handleSignOut() {
            isUserCurrentlyLoggedOut.toggle()
            try? FirebaseManager.shared.auth.signOut()
        }
}




struct UserProfile: View {
    
    @ObservedObject private var vm = MainMessagesViewModel()
    @State var shouldShowLogOutOptions = false
    
        var body: some View {
            VStack {
                VStack {
                    Header()
                    ProfileText()
                    Form {
                        NeedLocation()
                        
                    }
                   SignOut
                }
                Spacer()
                
            }
        }
    
    private var SignOut: some View {
            Button {
                shouldShowLogOutOptions.toggle()
            } label: {
                Text("Выйти")
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .foregroundColor(.red)
            .background(Color(red: 0.824, green: 0.882, blue: 0.906))
            .cornerRadius(15)
            .padding()
            .actionSheet(isPresented: $shouldShowLogOutOptions) {
                        .init(title: Text("Настройки"), message: Text("Подтвердить действие "), buttons: [
                            .destructive(Text("Выход"), action: {
                                print("handle sign out")
                                vm.handleSignOut()
                            }),
                                .cancel(Text("Отмена"))
                        ])
                
            }
            .fullScreenCover(isPresented:
                                $vm.isUserCurrentlyLoggedOut, onDismiss: nil) {
                LoginView(didCompleteLoginProcess: {
                    self.vm.isUserCurrentlyLoggedOut = false
                    self.vm.fetchCurrentUser()
                })
                
            }
        
    }
    }

    struct ProfileText: View {
        
        @ObservedObject private var vm = MainMessagesViewModel()
        
        var body: some View {
            VStack {
                VStack {
                    
                    Text("\(vm.chatUser?.email ?? "")")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.vertical, 3.0)
           
                    
                    
                    Text("ID: \(vm.chatUser?.uid ?? "")")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                        
                }
            }
        }
    }

struct NeedLocation: View {
    
    @State var showListLocation = false
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some View {
        
        Button (
            action: {
                showListLocation.toggle()
            },
            label: {
                Text("Карта")
                    .fullScreenCover(isPresented: $showListLocation) {
                        LocationsView().environmentObject(vm)
                    }
            })
        
//        Button (
//            action: {
//                showListLocation.toggle()
//            },
//            label: {
//                Text("Избранные")
//                    .fullScreenCover(isPresented: $showListLocation) {
//                        AddLocations()
//                    }
//            })
        Button (
            action: {
                showListLocation.toggle()
            },
            label: {
                Text("О приложении")
                    .fullScreenCover(isPresented: $showListLocation) {
                        AboutApp()
                    }
            })
    }
}


struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
//        UserProfile()
//            .preferredColorScheme(.dark)
        UserProfile()
    }
}

