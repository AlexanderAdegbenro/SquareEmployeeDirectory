//
//  EmployeeListView.swift
//  SquareEmployeeDirectory
//
//  Created by Alexander Adgebenro on 9/2/22.
//

import SwiftUI

struct EmployeeListView: View {
    
    @StateObject  var viewModel = EmployeeViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List(viewModel.employees,id: \.self) { employee in
                        EmployeeListCell(employee: employee)
                    }
                }
                .navigationBarTitle("Employees")
            }
            .task {
                viewModel.fetchAllEmployees()
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
    }
}
