//
//  PiramidView.swift
//  StonesTest
//
//  Created by Максим Лисица on 18.08.2021.
//

import SwiftUI

struct PiramidView: View {
    @ObservedObject var viewModel = PiramidViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var needShowFade: Bool
    @State var opacityText: Double = 0
    private let heightRectangle: CGFloat = 35
    private let offsetFromRectangle: CGFloat = 25
    
    var piramid: some View {
        ForEach(Array(viewModel.stones.enumerated()), id: \.offset) { index, stone in
            if viewModel.stones.last == stone, viewModel.didAppendStones {
                Rectangle()
                    .border(Color.black, width: 1)
                    .frame(width: 150, height: heightRectangle)
                    .offset(y: -heightRectangle * CGFloat(index))
                    .foregroundColor(stone.color)
                    .transition(.moveAndFade)
                    .animation(.easeInOut(duration: 1))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                opacityText = 1
                            }
                        }
                    }
            } else {
                Rectangle()
                    .border(Color.black, width: 1)
                    .frame(width: 150, height: heightRectangle)
                    .offset(y: -heightRectangle * CGFloat(index))
                    .foregroundColor(stone.color)
            }
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            let origin = proxy.frame(in: .local)
            
            ZStack(alignment: .center) {
                
                Rectangle()
                    .frame(width: origin.size.width / 1.1, height: origin.size.width / 1.1)
                    .cornerRadius(16)
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    Text("Keep it up!").font(.title).bold().opacity(opacityText)
                    ZStack {
                        piramid
                            .frame(width: 250, height: 150, alignment: .bottom)
                    }
                    Button("continue") {
                        presentationMode.wrappedValue.dismiss()
                        needShowFade.toggle()
                    }
                    .frame(width: 140, height: 36, alignment: .center)
                    .background(Color(red: 1, green: 238 / 255, blue: 0))
                    .foregroundColor(.black)
                    .cornerRadius(15)
                    .padding()
                    .frame(maxWidth: origin.size.width / 1.1, alignment: .trailing)
                    .opacity(opacityText)
                }
            }.frame(width: origin.size.width, height: origin.size.height, alignment: .center)
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                viewModel.didAppendStones = true
                viewModel.stones.append(CustomRectangle(coordinate: .zero))
                
            }
        }
    }
}

struct PiramidView_Previews: PreviewProvider {
    static var previews: some View {
        PiramidView(needShowFade: .constant(false))
    }
}
