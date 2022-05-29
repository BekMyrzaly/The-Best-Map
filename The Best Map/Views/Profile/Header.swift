//
//  Header.swift
//  The Best Map
//
//  Created by User on 25.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct Header: View {
    @AppStorage("rValue") var rValue = DefaultSettings.rValue
    @AppStorage("gValue") var gValue = DefaultSettings.gValue
    @AppStorage("bValue") var bValue = DefaultSettings.bValue
    
    @ObservedObject private var vm = MainMessagesViewModel()
    @State var isPresented = false
    var body: some View {
        ZStack(alignment: .top) {
            
            Rectangle()
                .padding(.bottom, 10.0)
                .overlay(alignment: .trailing) {
                    Button (
                        action: { self.isPresented = true },
                        label: {
                            Label("Изм.", systemImage: "pencil")
                        })
                    .padding(.trailing, 10.0)
                    .foregroundColor(.black)
                    .sheet(isPresented: $isPresented, content: {
                        SettingsView()
                    })
                }
                .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 120)
//            Image("avatar")
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                .shadow(radius: 10)
            
            
            WebImage(url: URL(string: vm.chatUser?.profileImageUrl ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipped()
                .cornerRadius(100)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                .shadow(radius: 10)
            
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
