//
//  ContentView.swift
//  AutocompleteSearch
//
//  Created by Mohammad Azam on 12/13/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject private var locationManager = LocationManager.shared
    @State private var search: String = ""
    @StateObject private var vm = SearchResultsViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                List(vm.places) { place in
                    Text(place.name)
                }
                
            }.searchable(text: $vm.searchText)
              
                .navigationTitle("Places")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
