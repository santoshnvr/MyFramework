//
//  Styles.swift
//  MyFramework
//
//  Created by Santosh Kumar on 4/21/23.
//

import Foundation
import SwiftUI

public struct CustomTextField: View {
    var sfSymbolName: String
    var placeHolder: String
    var prompt: String
    @Binding var field: String
    var isSecure: Bool = false
    
    public init(sfSymbolName: String, placeHolder: String, prompt: String, field: Binding<String>, isSecure: Bool) {
        self.sfSymbolName = sfSymbolName
        self.placeHolder = placeHolder
        self.prompt = prompt
        self._field = field
        self.isSecure = isSecure
    }
    
   public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: sfSymbolName)
                    .foregroundColor(.gray)
                    .font(.headline)
                if isSecure {
                    SecureField(placeHolder, text: $field).textInputAutocapitalization(.none)
                } else {
                    TextField(placeHolder, text: $field).textInputAutocapitalization(.none)
                }
            }
            .padding(8)
            .background(Color(UIColor.secondarySystemBackground))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            
            Text(prompt)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
        }
    }
}
