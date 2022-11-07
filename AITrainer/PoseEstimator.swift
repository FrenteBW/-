//
//  PoseEstimator.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2022/10/26.
//

import Foundation
import AVFoundation
import Vision
import Combine

class PoseEstimator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate, ObservableObject {
    let sequenceHandler = VNSequenceRequestHandler()
    @Published var bodyParts = [VNHumanBodyPoseObservation.JointName : VNRecognizedPoint]()
    @Published var isGoodPosture = true
    @Published var WristisGoodPosture = true
    @Published var ElbowisGoodPosture = true
    @Published var ShoulderisGoodPosture = true
    @Published var HipisGoodPosture = true
    @Published var KneeisGoodPosture = true
    @Published var AnkleisGoodPosture = true
    @Published var CoreisGoodPosture = true
    var subscriptions = Set<AnyCancellable>()
    
    override init() {
        super.init()
        $bodyParts
            .dropFirst()
            .sink(receiveValue: { bodyParts in self.DetectError(bodyParts: bodyParts)})
            .store(in: &subscriptions)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        let humanBodyRequest = VNDetectHumanBodyPoseRequest(completionHandler: detectedBodyPose)
        do {
            try sequenceHandler.perform(
              [humanBodyRequest],
              on: sampleBuffer,
                orientation: .right)
        } catch {
          print(error.localizedDescription)
        }
    }
    
    func detectedBodyPose(request: VNRequest, error: Error?) {
        guard let bodyPoseResults = request.results as? [VNHumanBodyPoseObservation]
          else { return }
        guard let bodyParts = try? bodyPoseResults.first?.recognizedPoints(.all) else { return }
        DispatchQueue.main.async {
            self.bodyParts = bodyParts
        }
    }

    func DetectError(bodyParts: [VNHumanBodyPoseObservation.JointName : VNRecognizedPoint]) {
        
        let rightWrist = bodyParts[.rightWrist]!.location
        let leftWrist = bodyParts[.leftWrist]!.location
        let rightElbow = bodyParts[.rightElbow]!.location
        let leftElbow = bodyParts[.leftElbow]!.location
        let rightShoulder = bodyParts[.rightShoulder]!.location
        let leftShoulder = bodyParts[.leftShoulder]!.location
        let Neck = bodyParts[.neck]!.location
        let rightHip = bodyParts[.rightHip]!.location
        let leftHip = bodyParts[.leftHip]!.location
        let Root = bodyParts[.root]!.location
        let rightKnee = bodyParts[.rightKnee]!.location
        let leftKnee = bodyParts[.rightKnee]!.location
        let rightAnkle = bodyParts[.rightAnkle]!.location
        let leftAnkle = bodyParts[.leftAnkle]!.location
        
        
        let WristParallel = rightWrist.y / leftWrist.y

        let ElbowParallel = rightElbow.y / leftElbow.y
        
        let ShoulderParallel = rightShoulder.y / leftShoulder.y
        
        let HipParallel = rightHip.y / leftHip.y
        
        let KneeParallel = rightKnee.y / leftKnee.y
        
        let AnkleParallel = rightAnkle.y / leftAnkle.y
        
        let CoreVertical = Neck.x / Root.x
        
        
        if WristParallel > 0.95 && WristParallel < 1.05 {
            self.WristisGoodPosture = true
        } else {
            self.WristisGoodPosture = false
        }

        if ElbowParallel > 0.95 && ElbowParallel < 1.05{
            self.ElbowisGoodPosture = true
        } else {
            self.ElbowisGoodPosture = false
        }
        
        if ShoulderParallel > 0.95 && ShoulderParallel < 1.05{
            self.ShoulderisGoodPosture = true
        } else {
            self.ShoulderisGoodPosture = false
        }
        
        if HipParallel > 0.95 && HipParallel < 1.05{
            self.HipisGoodPosture = true
        } else {
            self.HipisGoodPosture = false
        }
        
        if KneeParallel > 0.95 && KneeParallel < 1.05{
            self.KneeisGoodPosture = true
        } else {
            self.KneeisGoodPosture = false
        }
        
        if AnkleParallel > 0.95 && AnkleParallel < 1.05{
            self.AnkleisGoodPosture = true
        } else {
            self.AnkleisGoodPosture = false
        }
        
        if CoreVertical > 0.95 && CoreVertical < 1.05{
            self.CoreisGoodPosture = true
        } else {
            self.CoreisGoodPosture = false
        }
        
    }

}
