//
//  SwiftUIView.swift
//  The Best Map
//
//  Created by User on 24.05.2022.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct LoginView: View {
    
    let didCompleteLoginProcess: () -> ()

    @State private var isLoginMode = false
    @State private var email = ""
    @State private var password = ""
    
    @State private var shouldShowImagePicker = false
    

    var body: some View {
        NavigationView {
            ScrollView {

                VStack(spacing: 16) {
                    Picker(selection: $isLoginMode, label: Text("Выбрать здесь")) {
                        Text("Войти")
                            .tag(true)
                        Text("Создать Аккаунт")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())

                    if !isLoginMode {
                        Button {
                            shouldShowImagePicker.toggle()
                            
                        } label: {
                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(64)
                                } else {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundColor(Color(.label))
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64)
                                        .stroke(Color.black, lineWidth: 3)
                            )
                        }
                        .padding(.top, 12)
                        .padding(.bottom, 12)
                    }

                    Group {
                        TextField("Почта", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Пароль", text: $password)
                    }
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(18)

                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Авторизоваться" : "Создать Аккаунт")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }.background(Color.accentColor).cornerRadius(15)
                    }
                    Text(self.loginStatusMessage)
                        .foregroundColor(.accentColor)
                }
                .padding()

            }
            .navigationTitle(isLoginMode ? "Авторизоваться" : "Создать Аккаунт")
            .background(Color(.init(white: 0, alpha: 0.05))
                            .ignoresSafeArea())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
                           .ignoresSafeArea()
        }
    }
    
    @State var image: UIImage?

    private func handleAction() {
            if isLoginMode {
                loginUser()
            } else {
                createNewAccount()
            }
        }
    
    private func loginUser() {
           FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
               if let err = err {
                   print("Не удалось войти в систему:", err)
                   self.loginStatusMessage = "Не удалось войти в систему: \(err)"
                   return
               }

               print("Успешно вошли в систему как пользователь: \(result?.user.uid ?? "")")

               self.loginStatusMessage = "Успешно вошли в систему как пользователь: \(result?.user.uid ?? "")"
               
               self.didCompleteLoginProcess()
           }
       }
    
    @State var loginStatusMessage = ""
    
    private func createNewAccount() {
        if self.image == nil {
            self.loginStatusMessage = "Вы должны выбрать изображение"
            return
        }
        
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Не удалось создать пользователя:", err)
                self.loginStatusMessage = "Не удалось создать пользователя: \(err)"
                return
            }
            
            print("Успешно создали аккаунт: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = "Успешно создали аккаунт \(result?.user.uid ?? "")"
            
            self.persistImageToStorage()
        }
    }
    
    
    private func persistImageToStorage() {
        //        let filename = UUID().uuidString
                guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
                let ref = FirebaseManager.shared.storage.reference(withPath: uid)
                guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
                ref.putData(imageData, metadata: nil) { metadata, err in
                    if let err = err {
                        self.loginStatusMessage = "Не удалось отправить изображение на сервер: \(err)"
                        return
                    }
                    
                    ref.downloadURL { url, err in
                        if let err = err {
                            self.loginStatusMessage = "Не удалось получить URL-адрес: \(err)"
                            return
                        }
                        
                        self.loginStatusMessage = "Успешно сохраненное изображение с URL: \(url?.absoluteString ?? "")"
                        print(url?.absoluteString)
                        
                        guard let url = url else { return }
                        self.storeUserInformation(imageProfileUrl: url)
                    }
                }
            }
    
    private func storeUserInformation(imageProfileUrl: URL) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = ["email": self.email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString]
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData) { err in
                if let err = err {
                    print(err)
                    self.loginStatusMessage = "\(err)"
                    return
                }
                
                print("Успешно")
                
                self.didCompleteLoginProcess()
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(didCompleteLoginProcess: {
            
        })
    }
}
