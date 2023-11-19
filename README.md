# - Introduction

언제 어디서나 AITrainer와 함께 올바른 운동을 수행하세요.

 *주요 기능 안내*

- 수행할 동작을 선택 후, 안내 사항을 숙지하고 Start! 버튼을 누르면 카메라가 켜집니다. 

- 운동을 수행할 때, 사용자의 동작을 분석해 불균형이 일어나는 곳을 표시해 줍니다. 

- 화면을 보며 올바른 자세로 운동을 수행해보세요. 

- Dark 모드가 지원됩니다. 


*필수 권한*

- 사용자의 자세를 인식하고, 분석하기 위해선 카메라 접근을 허용해야 합니다. 수행할 동작을 선택 후 유의 사항을 숙지한 후, 카메라 접근을 허용해주세요. 


*Main Features Guide*

- After selecting the action to perform, be familiar with the instructions and press the Start! button to turn the camera on.

- When performing exercise, analyze the user's behavior and mark where the imbalance occurs with a red line.

- Look at the screen and perform the exercise in the right posture.

- Dark mode is available.


*Essential authority*

- Camera access must be allowed to recognize and analyze the user's posture. Please select the action to be performed, be familiar with the notices, and allow access to the camera.

# - 핵심 코드

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

# - Video & Images
<img src="https://user-images.githubusercontent.com/88021794/200296047-a877330a-c4d7-4a32-a059-31d0a3975e9b.png" width="200" height="400"/><img src="https://user-images.githubusercontent.com/88021794/200296014-ca34b483-ee7b-482a-b1b2-3f9898e0a169.png" width="200" height="400"/><img src="https://user-images.githubusercontent.com/88021794/200296033-94ef09dd-90eb-437a-bf07-0bd5dbca5dab.png" width="200" height="400"/><img src="https://user-images.githubusercontent.com/88021794/200296042-94338d4e-1b7d-430c-a2db-05ee78867261.png" width="200" height="400"/><img src="https://user-images.githubusercontent.com/88021794/200307420-62de56fc-12c3-4518-af49-9a1e6e2158c1.gif" width="200" height="400"/>


# - Appstore link

https://apps.apple.com/kr/app/aitrainer/id6444027026 

# - Contact 

📧 : abw2619@naver.com
