//
//  SideMenu.swift
//  Commuto_Interface_UI_Concept
//
//  Created by James Telzrow on 9/28/21.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    @Binding var currentTab: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 14) {
                HStack {
                    Text("Commuto")
                        .font(.title.bold())
                    Spacer()
                    Button {
                        withAnimation {
                            showMenu = false
                        }
                    } label: {
                        Text("Less")
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                }
                
            }
            .padding(.horizontal)
            .padding(.leading)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 45) {
                    TabButton(title: "Offers")
                    TabButton(title: "Swaps")
                    TabButton(title: "Funds")
                    TabButton(title: "Payment Accounts")
                    TabButton(title: "Governance")
                    TabButton(title: "Settings")
                    TabButton(title: "Help")
                }
                .padding()
                .padding(.leading)
                .padding(.top, 35)
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(Color.white
                        .ignoresSafeArea(edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String) -> some View {
        Button {
            currentTab = title
            withAnimation {
                showMenu = false
            }
        } label: {
            HStack(spacing: 14) {
                Text(title)
                    .font(.title3)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
