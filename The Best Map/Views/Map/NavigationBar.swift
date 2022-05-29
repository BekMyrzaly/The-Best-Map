////
////  NavigationBar.swift
////  The Best Map
////
////  Created by User on 25.05.2022.
////
//
//import SwiftUI
//
//struct NavigationBar: View {
//
//    init() {
//        UITabBar.appearance().barTintColor = .systemBackground
//        UINavigationBar.appearance().barTintColor = .systemBackground
//    }
//
//    @State var selectedIndex = 0
//    @State var shouldShowModal = false
//
//    @EnvironmentObject private var vm: LocationsViewModel
//    let maxWidthForIpad: CGFloat = 700
//
//    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso"]
//    var somebody: some View {
//
//
//        VStack(spacing: 0) {
//
//            ZStack {
//
//                switch selectedIndex {
//                case 0:
//                    NavigationView {
//                        ZStack {
//                            mapLayer.ignoresSafeArea()
//                            VStack(spacing: 0) {
//                                header
//                                    .padding()
//                                    .frame(maxWidth: maxWidthForIpad)
//                                Spacer()
//                                locationsPreviewStack
//
//                            }
//                        }
//                        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location  in
//                            LocationDetailView(location: location)
//                    }
//
//                case 1:
//                    ScrollView {
//                        Text("TEST")
//                    }
//
//                default:
//                    NavigationView {
//                        Text("Remaining tabs")
//
//                    }
//                }
//
//            }
//
////            Spacer()
//
//            Divider()
//                .padding(.bottom, 8)
//
//            HStack {
//                ForEach(0..<2) { num in
//                    Button(action: {
//
//                        if num == 2 {
//                            shouldShowModal.toggle()
//                            return
//                        }
//
//                        selectedIndex = num
//                    }, label: {
//                        Spacer()
//
//                        if num == 2 {
//                            Image(systemName: tabBarImageNames[num])
//                                .font(.system(size: 44, weight: .bold))
//                                .foregroundColor(.red)
//                        } else {
//                            Image(systemName: tabBarImageNames[num])
//                                .font(.system(size: 24, weight: .bold))
//                                .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
//                        }
//
//
//                        Spacer()
//                    })
//
//                }
//            }
//
//
//        }
//    }
//}
//
//struct NavigationBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationBar()
//    }
//}
