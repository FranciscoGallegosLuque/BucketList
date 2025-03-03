//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Francisco Manuel Gallegos Luque on 03/03/2025.
//

import Foundation

extension EditView {
    @Observable
    class ViewModel {
        enum LoadingState {
            case loading, loaded, failed
        }
        
    var loadingState = LoadingState.loading
    var pages = [Page]()
    
//    var name: String
//    var description: String
    var location: Location
        
        init(loadingState: EditView.ViewModel.LoadingState = LoadingState.loading, pages: [Page] = [Page](), location: Location) {
            self.loadingState = loadingState
            self.pages = pages
            self.location = location
        }
    }
}
