//
//  ExerciseItem.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2024/01/18.
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
