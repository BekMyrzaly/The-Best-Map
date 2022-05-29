//
//  AboutApp.swift
//  The Best Map
//
//  Created by User on 27.05.2022.
//

import SwiftUI

struct AboutApp: View {
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        NavigationView {
            ScrollView{
                VStack{
            Text("The Best Map - это приложение карта, благодаря которому вы можете найти и узнать различные достопримечательности  нашей страны. С The Best Map вы можете коротко ознакомиться  о местных достопримечательностях, а также спланировать свою поездку и чуть глубже узнать культуру Казахстана. Вы также можете узнать маршрут и полную информацию о достопримечательностях нажав на ссылку «Узнать больше на сайте».")
                        .foregroundColor(.primary)
                
                Divider()
                
            Text("На данный момент в приложении около 15 достопримечательности. Начиная с культурных монументов, популярных мечетей и заканчивая древними мавзолеями. В результате The Best Map похож на мини путеводитель, который всегда можно нести под рукой и поднимать культурную ценность.")
                        .foregroundColor(.primary)

                .navigationTitle("О приложении")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20, weight: .bold))
                            Text("Назад")
                        }.font(.title2)
                    }
                    
                }
                    
                }
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            
        }
    }
}

struct AboutApp_Previews: PreviewProvider {
    static var previews: some View {
        AboutApp()
    }
}
