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
                StoneView(stone: stone, index: index, offset: viewModel.getOffset(by: stone))
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
                StoneView(stone: stone, index: index, offset: viewModel.getOffset(by: stone))
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
                VStack(spacing: 20) {
                    Text("Keep it up!").font(.title).bold().opacity(opacityText)
                    ZStack {
                        piramid
                            .frame(width: 250, height: origin.size.height / 4.5, alignment: .bottom)
                    }
                    Button("continue →") {
                        presentationMode.wrappedValue.dismiss()
                        needShowFade.toggle()
                    }.font(.system(size: 17, weight: .black, design: .default))
                    .frame(width: 140, height: 36, alignment: .center)
                    .background(Color(red: 1, green: 238 / 255, blue: 0))
                    .foregroundColor(.black)
                    .cornerRadius(15)
                    .padding()
                    .frame(maxWidth: origin.size.width / 1.1, alignment: .trailing)
                    .opacity(opacityText)
                }.frame(height: origin.size.width / 1.1)
            }.frame(width: origin.size.width, height: origin.size.height, alignment: .center)
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                viewModel.didAppendStones = true
                viewModel.stones.append(PiramidStone(type: .big))
                
            }
        }
    }
}

struct PiramidView_Previews: PreviewProvider {
    static var previews: some View {
        PiramidView(needShowFade: .constant(false))
    }
}
