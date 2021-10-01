//
//  TopBarOffsetModifier.swift
//  Commuto_Interface_UI_Concept
//
//  Created by James Telzrow on 9/30/21.
//

import SwiftUI

struct TopBarOffsetModifier: ViewModifier {
    @Binding var offset: CGFloat
    func body(content: Content) -> some View {
        content.overlay(
            GeometryReader { proxy -> Color in
                let minY = proxy.frame(in: .named("SCROLL")).minY
                print(minY)
                DispatchQueue.main.async {
                    self.offset = minY
                }
                return Color.clear
            },
            alignment: .top
        )
    }
}
