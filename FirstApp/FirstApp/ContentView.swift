//
//  ContentView.swift
//  FirstApp
//
//  Created by Ryusuke Iizuka on 2023/08/08.
//

import SwiftUI

// structはクラスのようなものらしい
struct ContentView: View { // Viewクラスを継承
    @State var inputText = ""
    
    var body: some View { // someは今んとこ不明
        VStack {
            Button("計算") {
                
            }
            Text("価格：")
            Text("消費税8%：")
            Text("消費税10%：")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
