//
//  HeaderView.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/14.
//

import SwiftUI

struct HeaderView: View {
    
    private let width: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.pink)
                .rotationEffect(Angle(degrees: 15))
            
            VStack {
                Text("To Do List")
                    .font(.system(size: 50))
                    .bold()
                
                Text("Get things done")
                    .font(.system(size: 30))
            }
            .foregroundColor(.white)
            .padding(.top, 30)
        }
        .frame(width: width * 3, height: 300)
        .offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
