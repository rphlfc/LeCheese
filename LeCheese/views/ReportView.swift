//
//  ReportView.swift
//  LeCheese
//
//  Created by Raphael Cerqueira on 11/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct ReportView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("More options")
                        .font(.system(size: 18, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        self.isVisible.toggle()
                    }) {
                        Text("X")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                HStack {
                    Button(action: {
                        self.isVisible.toggle()
                    }) {
                        Text("Report Comment")
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
            }
            .padding(.vertical)
            .frame(width: 300)
            .background(Color.white)
            .cornerRadius(15)
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(isVisible: .constant(true))
    }
}
