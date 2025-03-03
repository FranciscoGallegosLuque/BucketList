//
//  EditView.swift
//  BucketList
//
//  Created by Francisco Manuel Gallegos Luque on 01/03/2025.
//

import SwiftUI

struct EditView: View {
    
//    let location: Location
    @State private var viewModel: ViewModel

    @Environment(\.dismiss) var dismiss
    
    var onSave: (Location) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.location.name)
                    TextField("Description", text: $viewModel.location.description)
                }
                
                Section("Nearby...") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading...")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = viewModel.location
                    newLocation.id = UUID()
                    newLocation.name = viewModel.location.name
                    newLocation.description = viewModel.location.description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await fetchNearbyPlaces()
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
//        self.viewModel = ViewModel(location: location)
        self.onSave = onSave
        
        _viewModel = State(initialValue: ViewModel(location: location))
    }
    
    func fetchNearbyPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(viewModel.location.latitude)%7C\(viewModel.location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else {
            print("bad URL: \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            viewModel.pages = items.query.pages.values.sorted() /*{ $0.title < $1.title }*/
            viewModel.loadingState = EditView.ViewModel.LoadingState.loaded
        }
        catch {
            viewModel.loadingState = EditView.ViewModel.LoadingState.failed
        }
    }
}

#Preview {
    EditView(location: .example) { _ in }
}
