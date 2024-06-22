//
//  ResultView.swift
//  quizapp
//
//  Created by Ryusuke Iizuka on 2024/06/16.
//

import SwiftUI

struct ResultView: View {
    @Binding var score: Int
    
    var body: some View {
        Text(String(score))
    }
}

//#Preview {
//    ResultView(score: 0)
//}
