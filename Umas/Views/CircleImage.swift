//
//  CircleImage.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

import SwiftUI

struct CircleImage: View {
    let image: UIImage
    let borderColor: Color?
    let strokeLineWidth: CGFloat
    let shadowRadius: CGFloat

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(borderColor ?? .gray, lineWidth: strokeLineWidth)
            }
            .shadow(radius: shadowRadius)
    }

    init(
        image: UIImage,
        borderColor: Color?,
        strokeLineWidth: CGFloat = 4,
        shadowRadius: CGFloat = 7
    ) {
        self.image = image
        self.borderColor = borderColor
        self.strokeLineWidth = strokeLineWidth
        self.shadowRadius = shadowRadius
    }
}

#Preview {
    CircleImage(
        image: .init(named: "Characters/Icons/Gold_Ship")!,
        borderColor: .red
    )
}
