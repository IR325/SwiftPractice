//
//  ResultView.swift
//  quizapp
//
//  Created by Ryusuke Iizuka on 2024/06/16.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var result: QuizResult
    
    var body: some View {
        Text(String(result.score))
    }
}

#Preview {
    ResultView(result: QuizResult())
}
