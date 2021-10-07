//
//  PaymentAccountListView.swift
//  Commuto_Interface_UI_Concept
//
//  Created by James Telzrow on 10/7/21.
//

import SwiftUI

struct PaymentAccountListView: View {
    var topEdge: CGFloat = 0
    @State var topBarOffset: CGFloat = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                Spacer()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .frame(height: getHeaderHeight(), alignment: .bottom)
                .background(
                    Color.gray.opacity(0.2)
                )
                .background(Color.white)
                .clipShape(RoundedCorner(corners: [.bottomLeft, .bottomRight], radius: 30))
                .overlay(
                    ZStack {
                        HStack(spacing: 15) {
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("Create")
                                    .frame(width: 60, height: 22)
                                    .font(.title3)
                                    .foregroundColor(.primary)
                            }
                            .padding(.horizontal)
                        }
                        Text("Payment Accounts")
                            .frame(width: 200, height: 22)
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                    }
                    .frame(height: 90 + topEdge)
                    .padding(.top), alignment: .top
                )
                .offset(y: -topBarOffset)
                .zIndex(1)
                VStack(spacing: 15) {
                    ForEach(0..<25) {_ in
                        PaymentAccountCardView(text: "Payment Account")
                    }
                }
                .zIndex(0)
            }
            .modifier(TopBarOffsetModifier(offset: $topBarOffset))
        }
        .coordinateSpace(name: "SCROLL")
        .ignoresSafeArea(.all, edges: .top)
    }
    func getHeaderHeight() -> CGFloat {
        return topEdge + 100
    }
}

struct PaymentAccountListView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentAccountListView()
    }
}

struct PaymentAccountCardView: View {
    var text: String
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                RoundedRectangle(cornerRadius: 30.0)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 75)
                Text(text)
            }
        }
        .padding(.horizontal)
    }
}
