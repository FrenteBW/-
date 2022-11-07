//
//  OverheadpressDescriptionView.swift
//  AITrainer
//
//  Created by 안병욱의 mac on 2022/10/26.
//

import SwiftUI

struct OverheadpressDescriptionView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var gradient = [Color("backgroundColor2").opacity(0), Color("backgroundColor2"), Color("backgroundColor2"), Color("backgroundColor2")]
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack(spacing: 0.0){
                    HStack{
                        CircleButton(action: {
                            dismiss()
                        }, image: "arrow.left")
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 60, leading: 10, bottom: 0, trailing: 20))
                    
                    Text("Notice")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))

                    ScrollView(.vertical, showsIndicators: false){
                        Text(" 1. The subject’s height should ideally be at least a third of the overall image height.\n\n\n 2. A large portion of the subject’s key body regions and points should be present in the image.\n\n\n 3. A subject wearing flowing or robe-like clothing reduces the detection accuracy.\n\n\n 4. Attempting to detect body poses in dense crowd scenes is likely to produce inaccurate results.\n\n\n 5. To perform more accurate exercise, exercise with the help of an expert.\n\n\n 6. Make sure that the line remains horizontal or vertical. \n\n\n")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 50)
                            .padding(.horizontal, 10)
                    }
                    NavigationLink{
                        OverheadpressMainView().navigationViewStyle(StackNavigationViewStyle())
                    } label: {
                        LargeButton()
                            .padding(.bottom, 30)
                            .padding(.horizontal, 20)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .offset(x: 20)
                .padding(.trailing, 40)
                 
            }
            .background(Color("backgroundColor2"))
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct OverheadpressDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        OverheadpressDescriptionView()
    }
}

