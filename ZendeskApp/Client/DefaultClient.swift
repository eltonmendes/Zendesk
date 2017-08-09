//
//  DefaultClient.swift
//  ZendeskApp
//
//  Created by Elton Mendes Viera on 09/08/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

import UIKit
import Alamofire

struct Authentication {
    static let username = "acooke+techtest@zendesk.com"
    static let password = "mobile"
}

class DefaultClient: NSObject {
    func performGETRequestWithURL(path : String , completion:@escaping (DataResponse<Any>)->Void) {
        
        Alamofire.request(zendeskBaseURL() + path).authenticate(user: Authentication.username, password: Authentication.password).responseJSON { response in
            completion(response)
        }
    }
    
    func zendeskBaseURL() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "baseURL") as! String
    }
}
