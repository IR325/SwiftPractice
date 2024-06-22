//
//  ContentView.swift
//  quizapp
//
//  Created by Ryusuke Iizuka on 2024/06/16.
//

import SwiftUI

struct QuizData {
    let year: Int
    let tournament_name: String
    let school: String
    let order: String
    let name: String
}


var quizData: [QuizData] = [
    QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "D2", name: "清原"),
    QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "D2", name: "桑田"),
    QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "D1", name: "立浪"),
    QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "D1", name: "宮本"),
    QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "S3", name: "福留"),
    QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "S2", name: "松井"),
    QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "S1", name: "ベリンガム"),
    QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "D2", name: "ウォーカー"),
    QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "D2", name: "サカ"),
    QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "D1", name: "ライス"),
    QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "D1", name: "シュマイケル"),
    QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "S3", name: "ホイルンド"),
    QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "S2", name: "エリクセン"),
    QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "S1", name: "クリステンセン"),
]


struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink(destination: InterhighQuizView(year: 2014, quizData: quizData.filter { $0.year==2014 && $0.tournament_name == "interhigh" })) {
                    Text("2014年インターハイ")
                }
                .padding() // 周囲にスペースを追加するためのmodifier
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
