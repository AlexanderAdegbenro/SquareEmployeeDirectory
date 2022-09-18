//
//  LoadingView.swift
//  SquareEmployeeDirectory
//
//  Created by Alexander Adgebenro on 9/4/22.
//

import SwiftUI

struct LoadingView: View {
    
    var frameSize: CGFloat = 72
    @State private var isAnimating = false
    
    
    var body: some View {
        VStack(spacing: 40){
            Image(systemName: "square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: frameSize)
                .rotationEffect(Angle(degrees: isAnimating ? 360.0 : 0.0))
                .animation(Animation
                            .spring(response: 1,
                                    dampingFraction: 0.7,
                                    blendDuration:0)
                            .repeatForever(autoreverses: false))
          
            Text("Getting Employee lists ...")
                .foregroundColor(.gray)
                .onAppear {
                    isAnimating = true
                }
        }
    }
}

struct CustomSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
