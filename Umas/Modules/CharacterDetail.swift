//
//  CharacterDetail.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

import SwiftUI

struct CharacterDetail: View {
    var character: Character

    var body: some View {
        let borderColor = Color(hexadecimal: character.borderColor ?? "")
        ScrollView {
            VStack {
                if let image: UIImage = .init(named: character.image ?? "") {
                    CircleImage(image: image, borderColor: borderColor ?? .gray)
                        .frame(maxWidth: 250)
                }
                Text(character.name).font(.title)
                Spacer()
            }
            .padding()
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    var characters: [Character] = UmaSDK.shared.retrieveCharacters()
    CharacterDetail(character: characters[0])
}
