//
//  HeaderView.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/14.
//

import SwiftUI

struct HeaderView: View {
    
    private let width: CGFloat = UIScreen.main.bounds.width
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
            }
            .foregroundColor(.white)
            .padding(.top, 80)
        }
        .frame(width: width * 3, height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title",
                   subtitle: "subtitle",
                   angle: 15,
                   background: .blue)
    }
}
