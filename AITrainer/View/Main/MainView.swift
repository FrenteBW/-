//
//  MainView.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2022/10/26.
//

import SwiftUI

struct MainView: View {
    @StateObject var poseEstimator = PoseEstimator()
    @State var shouldHide = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            VStack {
                ZStack {
                    GeometryReader { geo in
                        CameraViewWrapper(poseEstimator: poseEstimator)
                        StickFigureView(poseEstimator: poseEstimator, size: geo.size)
                        /*
                        Button("주의사항 ~ + Start👊") { self.shouldHide = true }
                            .lineLimit(nil)
                            .background(Color.gray.opacity(0.5))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .opacity(shouldHide ? 0 : 1)
                         */
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
