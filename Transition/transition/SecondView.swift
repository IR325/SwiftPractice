//
//  SecondView.swift
//  transition
//
//  Created by Ryusuke Iizuka on 2023/08/14.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        ZStack {
            Color(.orange)
                .edgesIgnoringSafeArea(.all)
            Text("Second View")
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
