//
//  DipsMainView.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2022/10/26.
//

import SwiftUI

struct DipsMainView: View {
    @StateObject var poseEstimator = PoseEstimator()
    @State var shouldHide = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor2")], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    GeometryReader { geo in
                        CameraViewWrapper(poseEstimator: poseEstimator)
                        DipsStickFigureView(poseEstimator: poseEstimator, size: geo.size)
                    }
                }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height
                        * 0.8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                HStack {
                    Text("Analyzing posture...")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
