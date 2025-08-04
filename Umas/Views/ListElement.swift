//
//  ListElement.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

import SwiftUI

struct ListElement: View {
    var listable: Listable

    var body: some View {
        let borderColor = Color(hexadecimal: listable.borderColor ?? "")
        HStack(alignment: .center) {
            if let image: UIImage = .init(named: listable.image ?? "") {
                CircleImage(
                    image: image,
                    borderColor: borderColor ?? .gray,
                    strokeLineWidth: 2,
                    shadowRadius: .zero
                )
                .frame(width: 50, height: 50)
            }
            Text(listable.name)
            Spacer()
            if listable.isFavourite {
                Image(systemName: "star.fill").foregroundStyle(.yellow)
            }
        }
        .padding()
    }
}

#Preview {
    let characters: [Character] = UmaSDK.shared.retrieveCharacters()
    Group {
        ListElement(listable: characters[0])
        ListElement(listable: characters[1])
    }
}
