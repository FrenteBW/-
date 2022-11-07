//
//  LateralraiseStickFigureView.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2022/10/26.
//

import SwiftUI

struct LateralraiseStickFigureView: View {
    @ObservedObject var poseEstimator: PoseEstimator
    var size: CGSize
    var body: some View {
        if poseEstimator.bodyParts.isEmpty == false {
            ZStack {
                // Right arm
                Stick(points: [poseEstimator.bodyParts[.rightWrist]!.location, poseEstimator.bodyParts[.rightElbow]!.location, poseEstimator.bodyParts[.rightShoulder]!.location, poseEstimator.bodyParts[.neck]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.green)
                // Left arm
                Stick(points: [poseEstimator.bodyParts[.leftWrist]!.location, poseEstimator.bodyParts[.leftElbow]!.location, poseEstimator.bodyParts[.leftShoulder]!.location, poseEstimator.bodyParts[.neck]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.green)
                // Root to nose
                Stick(points: [poseEstimator.bodyParts[.root]!.location,
                               poseEstimator.bodyParts[.neck]!.location,  poseEstimator.bodyParts[.nose]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.green)
                //Shoulder parallel
                if poseEstimator.ShoulderisGoodPosture == true
                {Stick(points: [poseEstimator.bodyParts[.rightShoulder]!.location,
                                poseEstimator.bodyParts[.leftShoulder]!.location], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.green)
                }
                else
                {
                    Stick(points: [poseEstimator.bodyParts[.rightShoulder]!.location,
                                    poseEstimator.bodyParts[.leftShoulder]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.red)
                }
                //Elbow parallel
                if poseEstimator.ElbowisGoodPosture == true
                {Stick(points: [poseEstimator.bodyParts[.rightElbow]!.location,
                                poseEstimator.bodyParts[.leftElbow]!.location], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.green)
                }
                else
                {
                    Stick(points: [poseEstimator.bodyParts[.rightElbow]!.location,
                                    poseEstimator.bodyParts[.leftElbow]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.red)
                }
                //Wrist parallel
                if poseEstimator.WristisGoodPosture == true
                {Stick(points: [poseEstimator.bodyParts[.rightWrist]!.location,
                                poseEstimator.bodyParts[.leftWrist]!.location], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.green)
                }
                else
                {
                    Stick(points: [poseEstimator.bodyParts[.rightWrist]!.location,
                                    poseEstimator.bodyParts[.leftWrist]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.red)
                }
                }
            }
        }
}
