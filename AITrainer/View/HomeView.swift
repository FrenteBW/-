//
//  HomwView.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2022/10/26.
//

import SwiftUI

struct HomeView: View {
    
    @State var animate = false
    @State var backimages: [String] = ["justpullup","justbarbellrow"]
    @State var legimages: [String] = ["justsquat","justdeadlift"]
    @State var shoulderimages: [String] = ["justshoulderpress","justoverheadpress","justlateralraise"]
    @State var chestimages: [String] = ["justinclinepress","justdips"]
    @State var freeimages: [String] = ["justfree"]
    
    var body: some View {
    
        ZStack{
            CircleBackground(color: Color("FirstCircle"))
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? -50 : -130, y: animate ? -30 : -100)
                .task{
                    withAnimation(.easeInOut(duration: 7).repeatForever()){
                        animate.toggle()
                    }
                }
            
            CircleBackground(color: Color("SecondCircle"))
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? 100 : 130, y: animate ? 150 : 100)
            
            VStack(spacing: 0.0) {
                Text("Choose Exercise")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20.0){
                        ScrollSection(title: "Leg", images: legimages)
                        ScrollSection(title: "Chest", images: chestimages)
                        ScrollSection(title: "Shoulder", images: shoulderimages)
                        ScrollSection(title: "Back", images: backimages)
                        ScrollSection(title: "Free posture", images: freeimages)
                    }
                    .padding(.bottom, 90)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background(
            LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor2")], startPoint: .top, endPoint: .bottom))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

