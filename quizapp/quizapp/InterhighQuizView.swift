//
//  InterhighQuiz.swift
//  quizapp
//
//  Created by Ryusuke Iizuka on 2024/06/16.
//

import SwiftUI

final class QuizResult: ObservableObject {
    @Published var score: Int = 0
}

struct InterhighQuizView: View {
    @ObservedObject var quizCondition: QuizCondition
    var year: Int
    var quizData: [QuizData]
    var schoolNames: Set<String>
    
    @State var inputNameD2_1: String = ""
    @State var inputNameD2_2: String = ""
    @State var inputNameD1_1: String = ""
    @State var inputNameD1_2: String = ""
    @State var inputNameS3: String = ""
    @State var inputNameS2: String = ""
    @State var inputNameS1: String = ""
    
    @ObservedObject var result = QuizResult()
    
    @State var submit: Bool = false
    
    init(quizCondition: QuizCondition) {
        self.quizCondition = quizCondition
        self.year = quizCondition.year
        self.quizData = quizCondition.filteredQuizData
        self.schoolNames = Set([])
        
        quizData.forEach{
            schoolNames.insert($0.school)
        }
    }

    
    var body: some View {
        // 問題をとってくる必要あり
        // 学校名をランダムでとってくる
        let schoolName: String = schoolNames.randomElement()!
        let question: String = "\(year)年インターハイ\(schoolName)高校のメンバーを答えよ"
        // 正解をとってくる
        let filteredQuizData: [QuizData] = quizData.filter { $0.school == schoolName }
        let answerD2_1: String = filteredQuizData.filter { $0.order == "D2"}[0].name
        let answerD2_2: String = filteredQuizData.filter { $0.order == "D2"}[1].name
        let answerD2: [String] = [answerD2_1, answerD2_2]
        let answerD1_1: String = filteredQuizData.filter { $0.order == "D1"}[0].name
        let answerD1_2: String = filteredQuizData.filter { $0.order == "D1"}[1].name
        let answerD1: [String] = [answerD1_1, answerD1_2]
        let answerS3: String = filteredQuizData.filter { $0.order == "S3"}[0].name
        let answerS2: String = filteredQuizData.filter { $0.order == "S2"}[0].name
        let answerS1: String = filteredQuizData.filter { $0.order == "S1"}[0].name
        
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
                    result.score += 1
                }
                if answerD2.contains(inputNameD2_2) {
                    result.score += 1
                }
                if answerD1.contains(inputNameD1_1) {
                    result.score += 1
                }
                if answerD1.contains(inputNameD1_2) {
                    result.score += 1
                }
                if inputNameS3 == answerS3 {
                    result.score += 1
                }
                if inputNameS2 == answerS2 {
                    result.score += 1
                }
                if inputNameS1 == answerS1 {
                    result.score += 1
                }
                //
                submit = true
            },
                   label : {Text("提出")}
            )
            .sheet(isPresented: $submit) {
                ResultView(result: result)
            }
            
        }
    }
}

//#Preview {
//    InterhighQuizView(quizCondition: QuizCondition())
//}
