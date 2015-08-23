//
//  BeerRestSvc.swift
//  Tap Room Framework
//
//  Created by Davey McNight on 8/19/15.
//  Copyright (c) 2015 DM. All rights reserved.
//

import Foundation
import Alamofire

class BeerRestSvc: NSObject {
    
    func getActiveBeers(){
        Alamofire.request(.GET, "http://localhost/beers/active")
            .responseJSON { (_, _, json, _) in
                let json = JSON(json!)
                //println(json)
                for (index, object) in json {
                    var beersArray: [Beer] = []
                   // var beerType = BeerType(id: object["typeId"].intValue,
                    var beer = Beer(id: object["id"].intValue, name: object["name"].stringValue, desc: object["description"].stringValue, pricePint: object["pricePint"].floatValue, price32: object["price32"].floatValue, price64: object["price64"].floatValue, active: object["active"].boolValue, url: object["url"].stringValue)
                    println(beer.name + " " + beer.desc!)
                    beersArray.append(beer);
                }//end loop
        }//end AF request
    }//end func
    
    
    
}
