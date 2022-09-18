//
//  ContentView.swift
//  SquareEmployeeDirectory
//
//  Created by Alexander Adgebenro on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = EmployeeViewModel()
    
    var body: some View {
      
        if viewModel.isLoading {
            LoadingView()
        } else {
              EmployeeListView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
