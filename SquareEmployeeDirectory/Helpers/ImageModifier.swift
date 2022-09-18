//
//  Image.swift
//  SquareEmployeeDirectory
//
//  Created by Alexander Adgebenro on 9/4/22.
//

import SwiftUI

extension Image {
  func imageModifier() -> some View {
    self
      .resizable()
      .scaledToFit()
  }
  
  func iconModifier() -> some View {
    self
      .imageModifier()
      .frame(maxWidth: 128)
      .foregroundColor(.gray)
      .opacity(0.5)
  }
}
