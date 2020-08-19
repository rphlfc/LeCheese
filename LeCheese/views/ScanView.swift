//
//  ScanView.swift
//  LeCheese
//
//  Created by Raphael Cerqueira on 11/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct ScanView: View {
    var body: some View {
        ZStack {
            Color("yellow").edgesIgnoringSafeArea(.top)
            
            VStack {
                HStack {
                    Text("Scan")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("yellow"))
                
                Spacer()
            }
            .background(Color.white)
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
