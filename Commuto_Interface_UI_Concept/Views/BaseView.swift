//
//  BaseView.swift
//  Commuto_Interface_UI_Concept
//
//  Created by jimmyneutront on 9/28/21.
//

import SwiftUI

struct BaseView: View {
    @State var showMenu: Bool = false 
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab = "Offers"
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    @State var dockOffset: CGFloat = 0
    var body: some View {
        let sideBarWidth = getRect().width - 90
        NavigationView {
            ZStack() {
                VStack(spacing: 0) {
                    TabView(selection: $currentTab) {
                        OfferListView()
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Offers")
                        SwapListView()
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Swaps")
                        FundsView()
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Balance")
                        PaymentAccountListView()
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Payment Accounts")
                    }
                    VStack(spacing: 0){
                        Divider()
                        HStack(spacing: 0) {
                            TabButton(label: "More", tab: "Sidebar")
                            TabButton(label: "Offers", tab: "Offers")
                            TabButton(label: "Swaps", tab: "Swaps")
                            TabButton(label: "$", tab: "Balance")
                        }
                        .padding([.top, .bottom], 15)
                    }
                    .offset(y: dockOffset)
                }
                .frame(width: getRect().width)
                .overlay(
                    Rectangle()
                        .fill(
                            Color.primary
                                .opacity(Double((offset / sideBarWidth) / 5))
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                )
                SideMenu(showMenu: $showMenu, currentTab: $currentTab)
                    .offset(x: -sideBarWidth + offset)
            }
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
    }
    @ViewBuilder
    func TabButton(label: String, tab: String) -> some View {
        Button {
            withAnimation {
                if tab == "Sidebar" {
                    showMenu = true
                } else {
                    currentTab = tab
                }
            }
        } label: {
            Text(label)
                .frame(width: 60, height: 22)
                .frame(maxWidth: .infinity)
                .font(.title3)
                .foregroundColor(.primary)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
