//
//  FavouriteButton.swift
//  Umas
//
//  Created by Ángel González on 5/8/25.
//

import SwiftUI

struct FavouriteButton: View {
    @State var isSet: Bool
    var action: (_ enabled: Bool) -> Void

    var body: some View {
        Button {
            isSet.toggle()
            action(isSet)
        } label: {
            Label("Toggle favourite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavouriteButton(isSet: true) { enabled in
        print("Enabled: \(enabled)")
    }
}
