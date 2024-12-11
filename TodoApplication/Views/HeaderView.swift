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
    var title : String
    var subTitle : String
    let gradients: LinearGradient
    var angle : Double
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .fill(gradients)
                . rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(.body))
                    .fontWeight(.heavy)
                    .bold()
                    .foregroundStyle(.white)
                    .padding()
                Text(subTitle)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
            }
            .padding(.top,30)
        }
        .frame(width: UIScreen.main.bounds.width * 3)
        .offset(y:-100)
        Spacer()
    }
}
#Preview {
    HeaderView(title: "Today's Game Plan",subTitle: "A goal without a plan is just a wish.",  gradients: LinearGradient(
        gradient: Gradient(colors: [.cyan, .orange]),
        startPoint: .bottom,
        endPoint: .top
    ), angle: -15)
}
