//
//  ResultView.swift
//  quizapp
//
//  Created by Ryusuke Iizuka on 2024/06/16.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var Score: ViewModel
    
    var body: some View {
        Text(String(Score.score))
    }
}

#Preview {
    ResultView(Score: ViewModel())
}
