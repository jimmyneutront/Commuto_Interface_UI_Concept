//
//  RoundedCorner.swift
//  Commuto_Interface_UI_Concept
//
//  Created by James Telzrow on 9/30/21.
//

import SwiftUI

struct RoundedCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
