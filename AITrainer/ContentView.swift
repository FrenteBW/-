//
//  ContentView.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoading: Bool = true
    
    var body: some View {

        ZStack {
            NavigationView {
                HomeView()
            }
                   if isLoading {
                       launchScreenView
                   }
               }
               .onAppear {
                   DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                       isLoading.toggle()
                   })
               }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

extension ContentView {
    
    var launchScreenView: some View {
        
        ZStack(alignment: .center) {
            LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor2")], startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            Text("AI Personal trainer")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
        }
        
    }
    
}
