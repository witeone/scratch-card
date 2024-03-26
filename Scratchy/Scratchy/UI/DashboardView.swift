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
    @Query private var cardList: [CardModel]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if cardList.isEmpty {
                    start
                } else {
                    content()
                }
            }
            .padding()
            .navigationTitle("Scratch card")
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

    private func content() -> some View {
        cardList.first.flatMap { model in
            VStack(
                alignment: .leading,
                spacing: 12) {
                    HStack {
                        CardView(title: model.cardId)

                        Spacer()
                    }

                    HStack {
                        Text(model.activated ? "Activated" : "Not activated")

                        Image(systemName: model.activated ? "checkmark.seal" : "exclamationmark.triangle")
                            .foregroundStyle(model.activated ? .green : .orange)
                    }

                    Divider()

                    NavigationLink {
                        ScratchView(viewModel: ScratchVM(), card: model)
                    } label: {

                        Text("Scratch")
                    }
                    .disabled(!model.cardId.isEmpty)

                    Divider()

                    NavigationLink{
                        ActivationView(card: model, viewModel: ActivationVM())
                    } label: {
                        Text("Activate")
                    }
                    .disabled(model.cardId.isEmpty || model.activated)

                    Divider()

                    Button(
                        action: {
                            reset()
                        }, label: {
                            HStack {
                                Text("Reset")
                                    .foregroundStyle(Color.red)

                                Image(systemName: "arrow.clockwise.circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(Color.red)
                            }
                        }
                    )

                    Spacer()
                }
        }
    }

    private func reset() {
        withAnimation {
            cardList.first.flatMap({ card in
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
