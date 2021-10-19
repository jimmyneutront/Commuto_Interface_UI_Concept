//
//  LineGraph.swift
//  Commuto_Interface_UI_Concept
//
//  Created by jimmyneutront on 10/1/21.
//

import SwiftUI

struct LineGraph: View {
    var data: [CGFloat]
    @State var currentPlot = ""
    @State var graphLineOffset: CGSize = .zero
    @State var showPlot = false
    @State var translation: CGFloat = 0
    var body: some View {
        GeometryReader { proxy in
            let height = proxy.size.height
            let width = proxy.size.width / CGFloat(data.count - 1)
            let avgPoint = data.reduce(CGFloat(0.0), { result, element in
                return result + element
            }) / CGFloat(data.count)
            let points = data.enumerated().compactMap { item -> CGPoint in
                let progress = ((item.element - avgPoint) / avgPoint)
                let pathHeight = (height / 2) + (progress * (height / 2)) * 20
                let pathWidth = width * CGFloat(item.offset)
                return CGPoint(x: pathWidth, y: -pathHeight + height)
            }
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLines(points)
                }
                .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
            }
            .overlay(
                VStack(spacing: 0) {
                    Text(currentPlot)
                        .font(.caption.bold())
                        .foregroundColor(.black)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .offset(x: translation < 10 ? 30: 0, y: translation < 70 ? 30 : 0)
                        .offset(x: translation > (proxy.size.width - 10) ? -30 : 0)
                        .offset(x: graphLineOffset.width)
                        .offset(y: -105)
                    /*Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 160 - 25 - 25 - (-1 * graphLineOffset.height))// + graphLineOffset.height/2)*/
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 25, height: 25)
                        .overlay(
                            Circle()
                                .fill(Color.black)
                                .frame(width: 10, height: 10)
                        )
                        .offset(y: 10)
                        .offset(graphLineOffset)
                    /*Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: -1 * graphLineOffset.height)*/
                }
                .frame(width: 80)
                .opacity(showPlot ? 1 : 0)
                , alignment: .bottomLeading
            )
            .contentShape(Rectangle())
            .gesture(DragGesture().onChanged({ value in
                withAnimation {
                    showPlot = true
                }
                let translation = value.location.x - 40
                let index = max(min(Int((translation / width).rounded()), data.count - 1), 0)
                currentPlot = "$ \(data[index])"
                self.translation = translation
                graphLineOffset = CGSize(width: points[index].x - 40, height: points[index].y - height)
            }).onEnded({ value in
                withAnimation {
                    showPlot = false
                }
            }))
        }
        .overlay(
            VStack(alignment: .leading) {
                let max = data.max() ?? 0
                let min = data.min() ?? 0
                Text("$ \(String(format: "%.2f", max))")
                Spacer()
                Text("$ \(String(format: "%.2f", min))")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .offset(x: 9)
            .padding(.vertical, 3)
        )
    }
}

struct LineGraph_Previews: PreviewProvider {
    static var previews: some View {
        OfferListView()
    }
}
