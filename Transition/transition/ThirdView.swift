//
//  ThirdView.swift
//  transition
//
//  Created by Ryusuke Iizuka on 2023/08/14.
//

import SwiftUI

struct ThirdView: View {
    @Binding var isShowThirdView: Bool
    
    var body: some View {
        ZStack {
            Color(.green)
            .edgesIgnoringSafeArea(.all)
            VStack{
                Text("ThirdView")
                Button {
                    isShowThirdView = false
                    } label: {
                        Text("閉じる")
                        .font(.largeTitle)
                        .padding()
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
            }
        }
    }
}
