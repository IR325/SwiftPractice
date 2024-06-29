//
//  ContentView.swift
//  quizapp
//
//  Created by Ryusuke Iizuka on 2024/06/16.
//

import SwiftUI

struct QuizData {
    var year: Int
    var tournament_name: String
    var school: String
    var order: String
    var name: String
}





struct ContentView: View {
    var quizData: [QuizData] = [
        QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "D2", name: "清原"),
        QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "D2", name: "桑田"),
        QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "D1", name: "立浪"),
        QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "D1", name: "宮本"),
        QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "S3", name: "福留"),
        QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "S2", name: "松井"),
        QuizData(year: 2014, tournament_name: "interhigh", school: "PL学園", order: "S1", name: "サブロー"),
        QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "S1", name: "ベリンガム"),
        QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "D2", name: "ウォーカー"),
        QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "D2", name: "サカ"),
        QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "D1", name: "ライス"),
        QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "D1", name: "シュマイケル"),
        QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "S3", name: "ホイルンド"),
        QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "S2", name: "エリクセン"),
        QuizData(year: 2015, tournament_name: "interhigh", school: "イングランド", order: "S1", name: "クリステンセン"),
    ]
    @State private var year: Int = 2014
    @State private var filteredQuizData: [QuizData] = []
    @State private var isActive: Bool = false // ナビゲーションのアクティブ状態を管理する状態変数
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.year = 2014
                    self.filteredQuizData = self.quizData.filter { $0.year == self.year && $0.tournament_name == "interhigh" }
                    self.isActive = true // ボタンが押されたら isActive を true に設定してナビゲーションをトリガーする
                }) {
                    Text("2014年インターハイ")
                }
                .padding()
                
                NavigationLink(destination: InterhighQuizView(year: $year, quizData: $filteredQuizData), isActive: $isActive) {
                    EmptyView() // 実際の表示はされない
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
