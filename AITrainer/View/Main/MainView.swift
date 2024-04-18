//
//  MainView.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2022/10/26.
//

import SwiftUI

struct MainView: View {
    @StateObject var poseEstimator = PoseEstimator()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            VStack {
                ZStack {
                    GeometryReader { geo in
                        CameraViewWrapper(poseEstimator: poseEstimator)
                        StickFigureView(poseEstimator: poseEstimator, size: geo.size)
                    }
                }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height
                        * 0.8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color.green)
                        .opacity(poseEstimator.isGoodPosture ? 1.0 : 0.0)
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color.red)
                        .opacity(poseEstimator.isGoodPosture ? 0.0 : 1.0)
                }
            }
        }
}
