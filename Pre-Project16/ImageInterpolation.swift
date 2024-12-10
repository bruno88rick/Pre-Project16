//
//  ImageInterpolation.swift
//  Pre-Project16
//
//  Created by Bruno Oliveira on 09/12/24.
//

import SwiftUI

struct ImageInterpolation: View {
    var body: some View {
        Image(.example)
            .interpolation(.none) //comment this line an see the diference
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ImageInterpolation()
}
