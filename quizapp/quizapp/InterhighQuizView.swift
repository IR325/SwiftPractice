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
    var quizData: [QuizData]
    var schoolNames: Set<String> = []
    
    
    @State var inputNameD2_1: String = ""
    @State var inputNameD2_2: String = ""
    @State var inputNameD1_1: String = ""
    @State var inputNameD1_2: String = ""
    @State var inputNameS3: String = ""
    @State var inputNameS2: String = ""
    @State var inputNameS1: String = ""
    
    @ObservedObject var Score = ViewModel()
    
    @State var submit: Bool = false
    
    init(quizData: [QuizData]){
        // 学校名のユニークを取る
        self.quizData.forEach{
            self.schoolNames.insert($0.school)
        }
    }

    
    var body: some View {
        // 問題をとってくる必要あり
        // 学校名をランダムでとってくる
        var schoolName: String = schoolNames.randomElement()
        var question: String = "\()年インターハイ\(schoolName)高校のメンバーを答えよ"
        // 正解をとってくる
        var filteredQuizData: [QuizData] =
        
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
