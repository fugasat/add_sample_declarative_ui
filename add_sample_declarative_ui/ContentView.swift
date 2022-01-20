//
//  ContentView.swift
//  add_sample_declarative_ui
//
//  Created by Satoru on 2022/01/20.
//

import SwiftUI

class AppManager: ObservableObject {
    @Published var num1: String = ""
    @Published var num2: String = ""
    @Published var answer: String = "0"
    
    func add() {
        guard let int1 = Int(num1) else {
           return
        }
        guard let int2 = Int(num2) else {
           return
        }
        answer = String(int1 + int2)
    }
}

struct ContentView: View {
    
    @ObservedObject var appManager: AppManager = AppManager()

    var body: some View {
        HStack {
            TextField("", text: $appManager.num1).border(Color.gray, width: 1)
            Text(" + ")
            TextField("", text: $appManager.num2).border(Color.gray, width: 1)
            Text(" = ")
            Text(appManager.answer)
            Button {
                appManager.add()
            } label: {
                Text("計算")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appManager: AppManager())
    }
}
