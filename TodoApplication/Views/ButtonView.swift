//
//  ButtonView.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 23/11/24.
//

import SwiftUI

struct ButtonView: View {
    let title : String
    let background : Color
    let action: () -> Void // closures
    var body: some View {
       
        Button(action: {
            action()
        }
       ,label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                Text(title)
                    .foregroundStyle(Color.white)
                
                 }
        })
        .padding()
    }
}

#Preview {
    ButtonView(title: "Log in", background: .blue) {
    }
}
