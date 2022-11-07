//
//  SquatStickFigureView.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2022/10/26.
//


import SwiftUI

struct SquatStickFigureView: View {
    @ObservedObject var poseEstimator: PoseEstimator
    var size: CGSize
    var body: some View {
        if poseEstimator.bodyParts.isEmpty == false {
            ZStack {
                // Right leg
                Stick(points: [poseEstimator.bodyParts[.rightAnkle]!.location, poseEstimator.bodyParts[.rightKnee]!.location, poseEstimator.bodyParts[.rightHip]!.location,
                poseEstimator.bodyParts[.root]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.green)
                // Left leg
                Stick(points: [poseEstimator.bodyParts[.leftAnkle]!.location, poseEstimator.bodyParts[.leftKnee]!.location, poseEstimator.bodyParts[.leftHip]!.location,
                               poseEstimator.bodyParts[.root]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.green)
                // Core parallel
                if poseEstimator.CoreisGoodPosture == true
                {Stick(points: [poseEstimator.bodyParts[.neck]!.location,
                                poseEstimator.bodyParts[.root]!.location], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.green)
                }
                else
                {
                    Stick(points: [poseEstimator.bodyParts[.neck]!.location,
                                    poseEstimator.bodyParts[.root]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.red)
                }
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
                // Hip parallel
                if poseEstimator.HipisGoodPosture == true
                {Stick(points: [poseEstimator.bodyParts[.rightHip]!.location,
                                poseEstimator.bodyParts[.leftHip]!.location], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.green)
                }
                else
                {
                    Stick(points: [poseEstimator.bodyParts[.rightHip]!.location,
                                    poseEstimator.bodyParts[.leftHip]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.red)
                }
                
                // knee parallel
            if poseEstimator.KneeisGoodPosture == true
            {Stick(points: [poseEstimator.bodyParts[.rightKnee]!.location,
                            poseEstimator.bodyParts[.leftKnee]!.location], size: size)
            .stroke(lineWidth: 5.0)
            .fill(Color.green)
            }
            else
                {
                Stick(points: [poseEstimator.bodyParts[.rightKnee]!.location,
                               poseEstimator.bodyParts[.leftKnee]!.location], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.red)
            }
                 
                // Ankle parallel
            if poseEstimator.AnkleisGoodPosture == true
            {Stick(points: [poseEstimator.bodyParts[.rightAnkle]!.location,
                            poseEstimator.bodyParts[.leftAnkle]!.location], size: size)
            .stroke(lineWidth: 5.0)
            .fill(Color.green)
            }
            else
                {
                Stick(points: [poseEstimator.bodyParts[.rightAnkle]!.location,
                               poseEstimator.bodyParts[.leftAnkle]!.location], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.red)
                }
                
                }
            }
        }
}


