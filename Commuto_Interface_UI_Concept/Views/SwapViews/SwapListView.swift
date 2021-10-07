//
//  SwapListView.swift
//  Commuto_Interface_UI_Concept
//
//  Created by James Telzrow on 10/2/21.
//

import SwiftUI

struct SwapListView: View {
    @State var maxHeight: CGFloat = 275//UIScreen.main.bounds.height / 2.3
    var topBarSize = 0
    var topEdge: CGFloat = 0
    @State var topBarOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                GeometryReader { proxy in
                    SwapTopBar(offset: $topBarOffset, maxHeight: maxHeight)
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
                            }
                            Text("Swaps")
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
                        OfferSummaryCardView(offer: "Swap")
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

struct SwapListView_Previews: PreviewProvider {
    static var previews: some View {
        SwapListView()
    }
}

struct SwapTopBar: View {
    @Binding var offset: CGFloat
    var maxHeight: CGFloat
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Swaps")
                .font(.largeTitle.bold())
            Spacer()
                .frame(height: 10)
            HStack {
                Text("Open Swaps:")
                    .font(.title3.bold())
                Spacer()
            }
            HStack {
                Text("7")
                    .font(.title.bold())
                Spacer()
            }
            HStack {
                Text("Open Volume:")
                    .font(.title3.bold())
                Spacer()
            }
            HStack {
                Text("1,350.97")
                    .font(.title.bold())
                Spacer()
            }
            HStack {
                Text("Disputed Swaps:")
                    .font(.title3.bold())
                Spacer()
            }
            HStack {
                Text("2")
                    .font(.title.bold())
                Spacer()
            }
        }
        .padding()
        .opacity(Double(getOpacity()))
    }
    func getOpacity() -> CGFloat {
        let progress = -offset * 3 / 100
        let opacity = 1 - progress
        return offset < 0 ? opacity : 1
    }
}
