//
//  ScratchView.swift
//  Scratchy
//
//  Created by Marek Polak on 25/03/2024.
//

import SwiftUI

struct ScratchView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var viewModel: ScratchVM
    let card: CardModel
    var body: some View {
        VStack {
            CardView(title: card.cardId)

            Button(action: {
                viewModel.scratch(model: card)
            }, label: {
                Text("Scratch")
            })
        }
    }
}

#Preview {
    ScratchView(
        viewModel: ScratchVM(),
        card: .init(cardId: "")
    )
}
