//
//  ContentView.swift
//  Scratchy
//
//  Created by Marek Polak on 25/03/2024.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [CardModel]

    var body: some View {
        NavigationView {
            VStack {
                if cards.isEmpty {
                    start
                } else {
                    cards.first.flatMap { model in
                        content(with: model)
                    }
                }
            }
            .navigationTitle("Scratchy")
        }
    }

    private var start: some View {
        Button(
            action: {
                modelContext.insert(CardModel(cardId: ""))

            }, label: {
                Text("Start")
            }
        )
    }

    private func content(with model: CardModel) -> some View {
        VStack(
            alignment: .leading,
            spacing: 12) {
                CardView(title: model.cardId)

                Text("Activated: \(model.activated)")

                NavigationLink {
                    ScratchView(viewModel: ScratchVM(), card: model)
                } label: {

                    Text("Scratch!")
                }
                .disabled(!model.cardId.isEmpty)

                NavigationLink{
                    ActivationView(card: model, viewModel: ActivationVM())
                } label: {
                    Text("Activate!")
                }
                .disabled(model.cardId.isEmpty)

                Spacer()

                Button(
                    action: {
                        reset()
                    }, label: {
                        Text("Reset")
                    }
                )
            }
    }

    private func reset() {
        withAnimation {
            cards.first.flatMap({ card in
                modelContext.delete(card)
            })
            modelContext.insert(CardModel(cardId: ""))
        }
    }
}

#Preview {
    DashboardView()
        .modelContainer(for: CardModel.self, inMemory: true)
}
