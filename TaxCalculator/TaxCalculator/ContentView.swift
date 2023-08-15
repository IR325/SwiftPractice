//
//  ContentView.swift
//  TaxCalculator
//
//  Created by Ryusuke Iizuka on 2023/08/09.
//

import SwiftUI

struct ContentView: View {
        @State var inputText = ""
        @State var tax8 = 0.0
        @State var tax10 = 0.0
        
    var body: some View {
        VStack(spacing: 20) {
            // 入力された文字列をどの変数に入れるか
            TextField("ここに文字を入力", text: $inputText)
            Button("計算") {
                // ??でアンパックしてエラーが出る場合のデフォルト値を決めている
                tax8 = (Double(inputText) ?? 0) * 0.08
                tax10 = (Double(inputText) ?? 0) * 0.1
            }
            Text("価格：\(inputText)") // f-stringみたいなもの
            Text("消費税8%：\(tax8)")
            Text("消費税10%：\(tax10)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
