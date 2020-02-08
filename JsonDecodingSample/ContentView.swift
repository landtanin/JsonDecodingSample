//
//  ContentView.swift
//  JsonDecodingSample
//
//  Created by Tanin on 08/02/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let consentRequest = ConsentRequest()
          consentRequest.getConsent { (consentResult) in
            switch consentResult {
            case .failure:
              print("Consent Request failed")
            case .success(let consent):
              print("""
                ConsentType = \(consent.consentType)
                thirdPartyName = \(consent.thirdPartyName)
                onBehalfOf = \(consent.onBehalfOf)
                """)
             
              let consenType: ConsentType = consent.consentType
              self.doSomethingW(consentType: consenType)
            }
          }
        
        return Text("Hello, World!")
    }
    
    func doSomethingW(consentType: ConsentType) {
      switch consentType {
      case .accounts:
        print("account type = \(consentType)")
      case .other:
        print("account type = \(consentType)")
      case .confirmationOfFunds:
        print("account type = \(consentType)")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
