//
//  ScrollSection.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2022/10/26.
//

import SwiftUI

struct ExerciseItem: View {
    var imageName: String
    var title: String

    var body: some View {
        NavigationLink(destination: destinationView()) {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 100, height: 130)
                    .cornerRadius(20)
                
                Text(title)
                    .foregroundColor(.white)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func destinationView() -> some View {
        switch imageName {
        case "justsquat": return AnyView(SquatDescriptionView())
        case "justdeadlift": return AnyView(DeadliftDescriptionView())
        case "justinclinepress": return AnyView(InclinepressDescriptionView())
        case "justdips": return AnyView(DipsDescriptionView())
        case "justshoulderpress": return AnyView(ShoulderpressDescriptionView())
        case "justoverheadpress": return AnyView(OverheadpressDescriptionView())
        case "justlateralraise": return AnyView(LateralraiseDescriptionView())
        case "justpullup": return AnyView(PullupDescriptionView())
        case "justbarbellrow": return AnyView(BarbellrowDescriptionView())
        default: return AnyView(FreeDescriptionView())
        }
    }
}

struct ScrollSection: View {
    @State var title = "Leg"
    @State var images: [String] = ["justsquat", "justdeadlift", "justpullup", "justbarbellrow", "justshoulderpress", "justoverheadpress", "justlateralraise", "justinclinepress", "justdips"]

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
