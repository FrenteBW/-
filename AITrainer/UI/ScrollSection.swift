//
//  ScrollSection.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2022/10/26.
//

import SwiftUI

struct ScrollSection: View {
    
    var title = ""
    var images: [String] = []

    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20.0){
                    ForEach(images.indices, id: \.self) { index in
                        ExerciseItem(imageName: images[index], title: titleForImage(images[index]))
                    }
                }
                .offset(x: 20)
                .padding(.trailing, 40)
            }
        }
    }

    private func titleForImage(_ imageName: String) -> String {
        switch imageName {
        case "justsquat": return "Squat"
        case "justdeadlift": return "Dead lift"
        case "justpullup": return "Pull up"
        case "justbarbellrow": return "Barbell row"
        case "justinclinepress": return "Incline press"
        case "justdips": return "Dips"
        case "justshoulderpress": return "Shoulder press"
        case "justoverheadpress": return "Overhead press"
        case "justlateralraise": return "Side lateral raise"
        default: return "Free posture"
        }
    }
}
