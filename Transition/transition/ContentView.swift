//
//  ContentView.swift
//  transition
//
//  Created by Ryusuke Iizuka on 2023/08/14.
//

// モディファイアはView構造体（Text()やButton()等）のプロパティを変更するための修飾子

import SwiftUI

struct ContentView: View {
    @State var isShowThirdView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: SecondView().navigationTitle("画面2")) {
                    Text("SecondViewへ")
                }
                .padding()
                .navigationTitle("画面1")
                Button {
                    isShowThirdView = true
                } label: {
                    Text("モーダル遷移")
                    .padding()
                }
                .sheet(isPresented: $isShowThirdView) {
                    ThirdView(isShowThirdView: $isShowThirdView)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
