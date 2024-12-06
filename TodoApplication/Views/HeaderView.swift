//
//  HeaderView.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//

import SwiftUI
//Today's Game Plan
//A goal without a plan is just a wish.
struct HeaderView: View {
    var Title : String = ""
    var SubTitle : String = ""
    let backgroundColor : Color
    var angle : Double
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                . rotationEffect(Angle(degrees: angle))
            VStack{
                Text(Title)
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .bold()
                    .foregroundStyle(.white)
                    .padding()
                Text(SubTitle)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
            }
            .padding(.top,30)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y:-100)
        Spacer()
    }
    
}

#Preview {
    HeaderView(Title: "Today's Game Plan", SubTitle: "A goal without a plan is just a wish.", backgroundColor: .cyan, angle: -15)
}
