//
//  ContentView.swift
//  StonesTest
//
//  Created by Максим Лисица on 01.02.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = StoneViewModel()
    
    private let heightRectangle: CGFloat = 35
    private let offsetFromRectangle: CGFloat = 25
    
    var body: some View {
        ZStack {
            Image("main").resizable()
            if viewModel.isChosePlace {
                ForEach(viewModel.stones, id: \.id) { stone in
                    
                    if viewModel.stones.last == stone {
                        Rectangle()
                            .border(Color.black, width: 1)
                            .frame(width: stone.coordinate.size.width - offsetFromRectangle, height: heightRectangle)
                            .position(x: stone.coordinate.midX, y: stone.coordinate.origin.y)
                            .foregroundColor(stone.color)
                            .transition(.moveAndFade)
                            .animation(.easeInOut(duration: 1))
                    } else {
                        Rectangle()
                            .border(Color.black, width: 1)
                            .frame(width: stone.coordinate.size.width - 25, height: heightRectangle)
                            .position(x: stone.coordinate.midX, y: stone.coordinate.origin.y)
                            .foregroundColor(stone.color)
                    }
                }
            }
            
            VStack {
                VStack(spacing: 0.0) {
                    // Можно увеличить детализацию, изменяя значения в первом ForEach и втором
                    ForEach((0...3), id: \.self) { row in
                        HStack(spacing: 0.0) {
                            ForEach((0...2), id: \.self) { column in
                                GeometryReader { geo in
                                    Button(action: {
                                        guard viewModel.containCoordinate(coord: (row, column)) else {
                                            return
                                        }
                                        viewModel.location = geo.frame(in: .global)
                                        viewModel.stones = []
                                        viewModel.isChosePlace = true
                                    }, label: {
                                        Rectangle().strokeBorder(lineWidth: viewModel.containCoordinate(coord: (row, column)) ? 4 : 1, antialiased: true).foregroundColor( viewModel.containCoordinate(coord: (row, column)) ? .red : .black)
                                    })
                                }
                            }
                        }
                    }
                }
                
                
                if viewModel.isChosePlace {
                    HStack {
                        Button("Add stone") {
                            let coorditaneY = viewModel.location.origin.y + viewModel.location.size.height - (heightRectangle + 3) - (heightRectangle * CGFloat(viewModel.stones.count))
                            viewModel.stones.append(CustomRectangle(coordinate: CGRect(x: viewModel.location.origin.x, y: coorditaneY, width: viewModel.location.size.width, height: viewModel.location.size.height)))
                        }
                        .frame(width: 150, height: 45)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(7)
                        
                        Button("Break Pyramid") {
                            viewModel.stones = []
                            viewModel.isChosePlace = false
                        }.frame(width: 150, height: 45)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(7)
                        
                    }.frame(height: 100, alignment: .center)
                } else {
                    Text("Choose a place for your pyramid").frame(height: 100, alignment: .center).font(.body)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
