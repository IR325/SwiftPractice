//
//  InterhighQuiz.swift
//  quizapp
//
//  Created by Ryusuke Iizuka on 2024/06/16.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var score: Int = 0
}

struct InterhighQuizView: View {
    // 問題文，解答の読み込み
    let question: String = "xxxx年インターハイxx高校のメンバーを答えよ"
    let answerD2: [String] = ["山田", "田中"]
    let answerD1: [String] = ["鈴木", "佐藤"]
    let answerS3: String = "木村"
    let answerS2: String = "高橋"
    let answerS1: String = "飯塚"
    
    @State var inputNameD2_1: String = ""
    @State var inputNameD2_2: String = ""
    @State var inputNameD1_1: String = ""
    @State var inputNameD1_2: String = ""
    @State var inputNameS3: String = ""
    @State var inputNameS2: String = ""
    @State var inputNameS1: String = ""
    
    @ObservedObject var Score = ViewModel()
    
    @State var submit: Bool = false
    
    var body: some View {
        VStack{
            Text(question)
            HStack {
                Text("D2")
                TextField("D2", text: $inputNameD2_1)
                TextField("D2", text: $inputNameD2_2)
            }
            HStack{
                Text("D1")
                TextField("D1", text: $inputNameD1_1)
                TextField("D1", text: $inputNameD1_2)
            }
            HStack{
                Text("S3")
                TextField("S3", text: $inputNameS3)
            }
            HStack{
                Text("S2")
                TextField("S2", text: $inputNameS2)
            }
            HStack{
                Text("S1")
                TextField("S1", text: $inputNameS1)
            }
            Button(action : {
                // scoreing
                if answerD2.contains(inputNameD2_1) {
                    self.Score.score += 1
                }
                if answerD2.contains(inputNameD2_2) {
                    self.Score.score += 1
                }
                if answerD1.contains(inputNameD1_1) {
                    self.Score.score += 1
                }
                if answerD1.contains(inputNameD1_2) {
                    self.Score.score += 1
                }
                if inputNameS3 == answerS3 {
                    self.Score.score += 1
                }
                if inputNameS2 == answerS2 {
                    self.Score.score += 1
                }
                if inputNameS1 == answerS1 {
                    self.Score.score += 1
                }
                //
                submit = true
            },
                   label : {Text("提出")}
            )
            .sheet(isPresented: $submit) {
                ResultView(Score: self.Score)
            }
            
        }
    }
}

#Preview {
    InterhighQuizView()
}
