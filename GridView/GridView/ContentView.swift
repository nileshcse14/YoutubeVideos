//
//  ContentView.swift
//  GridView
//
//  Created by Nilesh on 03/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid(alignment: .topLeading,
             horizontalSpacing: 5,
             verticalSpacing: 5) {
            GridRow {
                CustomRectangle(color: .yellow)
                CustomRectangle(color: .yellow)
                CustomRectangle(color: .yellow)
            }
            GridRow {
                Color.clear
                    .gridCellUnsizedAxes([.vertical, .horizontal])
                CustomRectangle(color: .red)
                CustomRectangle(color: .red)
            }
            GridRow {
                Color.clear
                    .gridCellUnsizedAxes([.vertical, .horizontal])
                    .gridCellColumns(2)
                CustomRectangle(color: .green)
            }
            GridRow {
                Rectangle()
                    .frame(width: 20, height: 20)
                    .gridColumnAlignment(.trailing)
                    //.gridCellAnchor(.center)
                CustomRectangle(color: .red)
            }
           
        }
        .padding()
    }
}

struct CustomRectangle: View {
    var color: Color
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(width: 100, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
