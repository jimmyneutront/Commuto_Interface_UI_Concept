//
//  OfferListView.swift
//  Commuto_Interface_UI_Concept
//
//  Created by James Telzrow on 9/30/21.
//

import SwiftUI

struct OfferListView: View {
    
    let maxHeight = UIScreen.main.bounds.height / 2.3
    var topEdge: CGFloat = 0
    @State var topBarOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                GeometryReader { proxy in
                    TopBar(offset: $topBarOffset, maxHeight: maxHeight)
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
                                Button {
                                    
                                } label: {
                                    Text("Filter")
                                        .frame(width: 45, height: 22)
                                        .font(.title3)
                                        .foregroundColor(.primary)
                                }
                                .padding(.horizontal)
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
                            Text("Offers")
                                .frame(width: 70, height: 22)
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                                .opacity(Double(topBarTitleOpacity()))
                                .offset(y: 2)
                        }
                        .frame(height: 90 + topEdge)
                        .padding(.top), alignment: .top
                    )
                }
                .frame(height: maxHeight)
                .offset(y: -topBarOffset)
                .zIndex(1)
                VStack(spacing: 15) {
                    ForEach(0..<15) {_ in
                        OfferSummaryCardView(offer: "Offer")
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
        let topHeight = maxHeight + topBarOffset
        return topHeight > (100 + topEdge) ? topHeight : (100 + topEdge)
    }
    
    func topBarTitleOpacity () -> CGFloat {
        let progress = -(topBarOffset + 60) / (maxHeight - (80 + topEdge))
        return progress
    }
}

struct OfferListView_Previews: PreviewProvider {
    static var previews: some View {
        OfferListView()
    }
}

struct TopBar: View {
    @Binding var offset: CGFloat
    var maxHeight: CGFloat
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Offers")
                .font(.largeTitle.bold())
            Text("Some more text here")
            Text(offset.description)
        }
        .padding()
        .opacity(Double(getOpacity()))
    }
    
    func getOpacity() -> CGFloat {
        let progress = -offset / 150
        let opacity = 1 - progress
        return offset < 0 ? opacity : 1
    }
}

struct OfferSummaryCardView: View {
    var offer: String
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                RoundedRectangle(cornerRadius: 30.0)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 75)
                Text(offer)
            }
        }
        .padding(.horizontal)
    }
}
