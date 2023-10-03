//
//  ColorCell.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/10/4.
//

import SwiftUI

struct ColorCell: View {
    
    let color: Color
    let index: Int
    let selectedColorIndex: Int
    let action: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(color)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: index == selectedColorIndex ? 5 : 0)
            )
            .frame(width: 40, height: 40)
            .onTapGesture {
                action()
            }
    }
}

struct ColorCell_Previews: PreviewProvider {
    static var previews: some View {
        ColorCell(color: .red, index: 0, selectedColorIndex: 0) {
        }
    }
}
