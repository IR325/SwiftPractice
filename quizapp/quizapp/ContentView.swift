//
//  ContentView.swift
//  quizapp
//
//  Created by Ryusuke Iizuka on 2024/06/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: InterhighQuizView().navigationTitle("画面2")) {
                                Text("xxxx年インターハイクイズ")
                            }
                            .padding()
                            .navigationTitle("画面1") // 以降にクイズの種類並べる
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
