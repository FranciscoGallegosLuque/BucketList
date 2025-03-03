//
//  ContentView.swift
//  BucketList
//
//  Created by Francisco Manuel Gallegos Luque on 25/02/2025.
//


//struct User: Identifiable, Comparable {
//    let id = UUID()
//    var firstName: String
//    var lastName: String
//    
//    static func < (lhs: User, rhs: User) -> Bool {
//        lhs.lastName < rhs.lastName
//    }
//}
//
//struct ContentView: View {
//    let users = [
//        User(firstName: "Arnold", lastName: "Rimmel"),
//        User(firstName: "Kristine", lastName: "Kochanski"),
//        User(firstName: "David", lastName: "Lister")
//    ].sorted()
//    
//    var body: some View {
//        List(users) { user in
//            Text("\(user.lastName), \(user.firstName)")
//        }
//    }
//}

//struct ContentView: View {
////    var body: some View {
////        Text("Hi")
////        Button("Tap") {
////            test()
////        }
////    }
////
////    func test() {
////        print(URL.documentsDirectory)
////    }
//    var body: some View {
//        Button("Read and write") {
//            let data = Data("Test Message".utf8)
//            let url = URL.documentsDirectory.appending(path: "message.txt")
//            
//            do {
//                try data.write(to: url, options: [.atomic, .completeFileProtection])
//                let input = try String(contentsOf: url, encoding: .utf8)
//                print(input)
//                print(URL.documentsDirectory)
//            } catch {
//                print(error.localizedDescription)
//            }
//            
//        }
//    }
//}

//struct Loadingview: View {
//    var body: some View {
//        Text("Loading...")
//    }
//}
//
//struct SuccessView: View {
//    var body: some View {
//        Text("Success!")
//    }
//}
//
//struct FailedView: View {
//    var body: some View {
//        Text("Failed!")
//    }
//}
//
//struct ContentView: View {
//    enum LoadingState {
//        case loading, success, failed
//    }
//    
//    @State private var loadingState = LoadingState.loading
//    
//    var body: some View {
//        switch loadingState {
//        case .loading:
//            Loadingview()
//        case .success:
//            SuccessView()
//        case .failed:
//            FailedView()
//        }
//        
//    }
//}



//struct ContentView: View {
//    struct Location: Identifiable {
//        let id = UUID()
//        var name: String
//        var coordinate: CLLocationCoordinate2D
//    }
//    
//    let locations = [
//        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
//        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)),
//    ]
//    @State private var position = MapCameraPosition.region(
//        MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 51.50722, longitude: -0.1275),
//            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//        )
//    )
//
////    let position = MapCameraPosition.region(
////        MKCoordinateRegion(
////            center: CLLocationCoordinate2D(latitude: 51.50722, longitude: -0.1275),
////            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
////        )
////    )
//    
//    var body: some View {
////        Map()
////            .mapStyle(.imagery)
////            .mapStyle(.hybrid)
////            .mapStyle(.hybrid(elevation: .realistic))
////        Map(interactionModes: [.rotate, .zoom])
////        Map(interactionModes: [])
////        Map(initialPosition: position)
////        Map {
////            ForEach(locations) { location in
//////                Marker(location.name, coordinate: location.coordinate)
////                Annotation(location.name, coordinate: location.coordinate) {
////                    Text(location.name)
////                        .font(.headline)
////                        .padding()
////                        .background(.blue.gradient)
////                        .foregroundStyle(.white)
////                        .clipShape(.capsule)
////                }
////                .annotationTitles(.hidden)
////            }
////        }
////        VStack {
////            MapReader { proxy in
////                Map()
////                    .onTapGesture { position in
////                        if let coordinate = proxy.convert(position, from: .local) {
////                            print(coordinate)
////                        }
////                    }
////            }
////        }
////        VStack {
////            Map(position: $position)
//////                .onMapCameraChange { context in
//////                    print(context.region)
//////                }
////                .onMapCameraChange(frequency: .continuous) { context in
////                    print(context.region)
////                }
////            
////            HStack(spacing: 50) {
////                Button("Paris") {
////                    position = MapCameraPosition.region(
////                        MKCoordinateRegion(
////                            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
////                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
////                            )
////                    )
////                }
////                
////            }
////            
////            HStack(spacing: 50) {
////                Button("Tokyo") {
////                    position = MapCameraPosition.region(
////                        MKCoordinateRegion(
////                            center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
////                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
////                            )
////                    )
////                }
////                
////            }
////        }
//    }
//}



//struct ContentView: View {
//    @State private var isUnlocked = false
//    
//    var body: some View {
//        VStack {
//            if isUnlocked {
//                Text("Unlocked")
//            } else {
//                Text("Locked")
//            }
//        }
//        .onAppear(perform: authenticate)
//    }
//        
//    
//    
//    func authenticate() {
//        let context = LAContext()
//        var error: NSError?
//        
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "We need to unlock your data."
//            
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
//                success, authenticationError in
//                if success {
//                    isUnlocked = true
//                } else {
//                    //else
//                }
//            }
//        } else {
//            // something else
//        }
//    }
//}

import MapKit
import SwiftUI
import LocalAuthentication

struct ContentView: View {
        let startPosition = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
                span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
            )
        )
        
        @State private var viewModel = ViewModel()
        @State private var standardMode = true
        
    var body: some View {
        //            if viewModel.isUnlocked {
        ZStack(alignment: .topTrailing) {
            
            MapReader { proxy in
                Map(initialPosition: startPosition){
                    ForEach(viewModel.locations) { location in
                        Annotation(location.name, coordinate: location.coordinte) {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(.circle)
                                .onLongPressGesture {
                                    viewModel.selectedPlace = location
                                }
                                
                        }
                    }
                }
                .mapStyle(standardMode ? .standard : .hybrid)
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        viewModel.addLocation(at: coordinate)
                    }
                }
                .sheet(item: $viewModel.selectedPlace) { place in
                    EditView(location: place) {
                        viewModel.update(location: $0)
                    }
                }
            }
            Toggle("", isOn: $standardMode)
                .padding()
        }
    }
//            else {
//                Button("Unlock places", action: viewModel.authenticate)
//                    .padding()
//                    .background(.blue)
//                    .foregroundStyle(.white)
//                    .clipShape(.capsule)
//            }
//        }
    }


#Preview {
    ContentView()
}
