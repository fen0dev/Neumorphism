//
//  BottomPage.swift
//  Neumorphism
//
//  Created by mvh on 22/06/2023.
//

import SwiftUI

struct BottomPage: View {
    var name: String = "person.fill"
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(1...15, id: \.self) {_ in
                    rowCase(name: name)
                }
            }
            .padding(.bottom, 80)
        }
    }
    
    @ViewBuilder
    func rowCase(name: String) -> some View {
        HStack {
            Image(systemName: name)
                .font(.body)
        }
        .padding()
    }
}

struct BottomPage_Previews: PreviewProvider {
    static var previews: some View {
        BottomPage()
    }
}
